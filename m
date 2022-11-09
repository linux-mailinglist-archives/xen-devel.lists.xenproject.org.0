Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C526226C9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440742.694891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshHi-0007mj-QP; Wed, 09 Nov 2022 09:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440742.694891; Wed, 09 Nov 2022 09:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshHi-0007kJ-NX; Wed, 09 Nov 2022 09:22:14 +0000
Received: by outflank-mailman (input) for mailman id 440742;
 Wed, 09 Nov 2022 09:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oshHg-0007kD-BI
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:22:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbdb6dca-600f-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:22:10 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 04:21:59 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 09:21:57 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:21:57 +0000
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
X-Inumbo-ID: fbdb6dca-600f-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667985730;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DLJsNvHDALY0jAq0emL9Sxhp8HyNQccgjSFLDh8mNBo=;
  b=bzYSDJSoSsy3XUGn7SK0xT6aBNLcmCvH0u1hFtexqINuUe0uAilFuj8L
   GlJbtHatBYbZHIbf+ZssXzkjdAv4Jmaazg11opNIetN5ln5yTM2oIIl8S
   N5ELG/bsoevKIo0a39NpFW+zW84ypgWlYZyhPDWzLraIMVNSVFi5mMmR8
   E=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 84053412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7Tay4a6O+IznVXAQ+l2MJgxRtPTGchMFZxGqfqrLsTDasY5as4F+v
 mcWDWyAOKvbZmTwe9l+b4S080gEuMWBmIRnGwNqpCg9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 a1HBTVSaj65rMWrza63VeNUvfg9I5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOiF3Nn9I7RmQe1YkliZo
 CTa+H7+ATkRNcCFyCrD+XWp7gPKtXOnAN9JSOTinhJsqGGQmmk5FhwWb3aU/d2z1x66fNZ7a
 HVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4orZ5RyIQFcNSDFpYcYj8sQxQFQC2
 laXkvvzCDdosbnTTmiSnp+LqRuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpcsC1qH+8VWZhTup/8DNVlRsvlWRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:CbcWf6Brb9v1THDlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wOJSepLq59ts5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84053412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cgg7mjHFh66e25hGpy4zDhJGQtfzCH46Z/4Zd18jOgsfELA2xpv+0LtqSyQKrsgp2hvkNqYwxByuS3Chh3Ajs/4GVVFC8FSKzNBshMdrSgA/Fm0eel22mGiykCqvdZVRjc8WUz+jeyiNlbLWXOKO4mZHlfNncpXEwU9xJPHapEXAiIgIAeOSHP3UsMBf8O/XPQaRVt7s9kjeXaoHLy7mzevXmv0X4tnXM22lc35IqUPuNCkrc+pvzege+jqoAp26Wqw2AMsUsy9penswszq4ZVecCRmRr+dVw2oZBYyutIJVaU8DUcvr6ms9vk4u3vuVAyCGY2Aa8e8BnTtUh60tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLJsNvHDALY0jAq0emL9Sxhp8HyNQccgjSFLDh8mNBo=;
 b=RCqUmpZ/GzJbm1So/3ub7ew4JolEFoK1U+uF43kxAtSAP/m3hFD7bSPiJD9Xia6BSmRrYRu682d6D3cVzqoS97uUzd1LtMTJ6UKtLWD8p54HgzpaqjAH0kxJXUwLo7Mkzkqfeo5P++E/RF5VnjWlYnRh72Nk+BNGYYGYI+VAsf57sh2x5SqBdicu0KXU3EG80efpz6kn5Xe04dmAIHeLCpfqDMYC6S33p9KWLVJDF/2t4lxCHH5MNjAjnPHQ3HrGUNH8dhst4AqNdPQJYb2yLXiGz75iv+PBHMaYu6+IOh8Jzc3oFc85ehAGBhaBx37EDbJvwezRolhcS5CCxp8uOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLJsNvHDALY0jAq0emL9Sxhp8HyNQccgjSFLDh8mNBo=;
 b=py+ZQ3W4s5W4GyJzUHFoF2WWzo8cNg9wjGSmFSTmKsSHLqIdXjKTGZTzD3t40Y+8uUJJMxqzfE0mnPDemraI9MWJI9PZPbV4JqBWDWiHT7Pgxh/UL06hg/74f5mHdNP6TINc6qSl70jOjANKUhxFmUbOibLu6XcXtocj/x22uFE=
From: Edwin Torok <edvin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Thread-Topic: [PATCH for-4.17 v3 09/15] tools/ocaml/xenstored/store.ml: fix
 build error
Thread-Index: AQHY84enx+9R1HXBN0OC3OTqctPuu6415EUAgABJboCAACSeAA==
Date: Wed, 9 Nov 2022 09:21:57 +0000
Message-ID: <D9D3FE01-976F-4609-BBED-961BE59E09F8@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <09afc07ba0ba65afc02028bd6b4950d8e51af69b.1667920496.git.edvin.torok@citrix.com>
 <AS8PR08MB79910C8281C7C356450152C4923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
In-Reply-To: <1e994604-7a3f-ef5f-63f4-d03e4abe4124@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|BY5PR03MB5063:EE_
x-ms-office365-filtering-correlation-id: 9b9c6aa9-e93d-4ecf-68cb-08dac233d945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nGR645d4hdD/wk1geKRtpX9lwBAWjvLAzh//kDLoyMonAYQm8EQNX1o6vp7GCEODUlv+qmZxOUx1yrTewE1XnOaMGeqKw92h7l1caWuF3t6UqnBQZJCfP4R2Mq20VKEr0lPfQDdbulpWoRq2hvVZ1DRASk0YkRpVgtxuTEnUrzv8sH3V7kRKeOEhZczTuKdkh7g164wWIqZo3sbDew92++Dl8dFcy3keE52upjTsDfYuVzhXXJRXvjH7lwZdQ+FNPTg2DinpwMwSXEp7lAEomZEyyv/t6Y/G6wD5ur6fi21sUKPBH4gaEimVvORL8IDiqEZQwfI4sz0ImElqLZi/NXWCrIrD4XvHl0Sk/7e0ZgW89O7rukVMsVsVBDZ2wCsj+ee1OCN8Po9XGUl3+GbAsqKnqfVO5vt3cWM0x8ZcEfJUuH7Fax5HSDXRXfZKpfDJpbgnISV2D/4dkeRXI04bu+Zz0JzN7gCxzELR9P9EZ6YtZ3RbP68s+nSyHZxB+EhW3u3oL0WUWZb8/9YYkt3yDoq5rwpKFg7UrSzXvrSch0dqZzQoDj1N3+oCo/qu/gBE08fzx+mu6dcdSqWblyyk5snpHe+xav55M6n9uszJ3wUWTARCUdZ2nTRMFjSbQUV8aRRfTZCndo8vQ8Zq5xUBS/dQeD3kSLnEPPGYRqoJK6BgacfocNW3d543O2G00ExL+vJUrbTh9beRhejSY78oAodQVsDf2j1FWjCX34VZT9E79MQwAnBqfVpn+ATUwaza8CbczQ5vQ05BBqGteqCXkLOOYaGPU+ZPesBflCzZ76Csj+aQXxsp202SHXvh4zQjsVyaJh60AU51+4nbGqKZHg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(122000001)(38070700005)(38100700002)(82960400001)(86362001)(54906003)(36756003)(6916009)(316002)(966005)(71200400001)(8936002)(6486002)(478600001)(41300700001)(33656002)(66446008)(76116006)(5660300002)(4326008)(66476007)(64756008)(66556008)(8676002)(91956017)(2906002)(66946007)(6512007)(53546011)(26005)(6506007)(83380400001)(66574015)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXpwbkQvYWhrc0hybWhtdmp0WTM1VC8wSFI4Vmxrdi9uZjJ2RW9nNzV0Q1Bl?=
 =?utf-8?B?WjYxRitZSEQyQllqY3RpYWRpZ1lPNGZvU0tjM1IzY201WXFpYnlSanBSM3Zm?=
 =?utf-8?B?aWpodnp6YllTZy9IVmVTWlg1dVJDRE5yMGUrV0krRnFQUUhPalZDcmZZQzJu?=
 =?utf-8?B?d1kzV21JN0ZlWkMreUZjZG51bWZqdDZSdVFNa0tRNnY4WURzUFNMaER6MlVJ?=
 =?utf-8?B?QVZNNFc3SDJadThxckpDTTBpbzdJN3JHRXlLR2F2TGVLd2FMZHE2ZlYwSDVu?=
 =?utf-8?B?dXlzVlpPSlhGM2xBQkNISjdDeUFsaWRRR1R0KzJOeUJHUklyaXZCTW1iY2tW?=
 =?utf-8?B?RExRZ2xzRXEvWGVwZDk5NkR2MitPV3Z1MzRUNnFIaGZGdGczbGgwNWU0Q09u?=
 =?utf-8?B?clhSR1RRcjBVMUxpZ0R5dlVSZllkbUs2bWVyZ2hvbFVXZDRSSnFsaWpyekJD?=
 =?utf-8?B?K09PSG9QVlFPZkNsR3N0aktrZ29keWxxSXVqMmNTa1JhN0p1eEZoUHpWdkF1?=
 =?utf-8?B?WnI1eVhtTnpick5xSGl0bEVBeTgwRlJ0L21sdVVSQnFpM28wQnpvOU9XRHBj?=
 =?utf-8?B?UkN3Z1UwTXJMV3FIQXI0T0hQKzdaRUZzZzhCSTl5aGxyTVlMNUNpMWtIcWpV?=
 =?utf-8?B?S3pBa1pTZS9lRzJTcXJtL0lQQ1pkVWZUdFhacGxoeWZKdTB1NDBKR3VMdTQ0?=
 =?utf-8?B?UE9hZDRpaC9VejdBZk54SGxWRVJnN1ZDeTNHTDhoaVlROVRXNlZnYndjbGR4?=
 =?utf-8?B?TXBlNHZSNmZKZHBzYys2TjhPTFRib1Bkd0pDQXpjRVAvTEx2OGVkaVN0YWEw?=
 =?utf-8?B?T2Mzb3NzZ0oxM3BzZzB0RDF1UmNrV1NYUHhJN3lYSG8yNE94U2RGczNqWkFp?=
 =?utf-8?B?cDllNk9EeVpXRFZwbmw3TFB1aG9pK2FOWllDakZMeDZvTkNZNVBRTEpYY2lH?=
 =?utf-8?B?SjBvUkI2aDcyZDN1c1dVamE5ODRTcHM2VU54eDkxdGwrMXRyYzhwblJMMHg4?=
 =?utf-8?B?UmNKMDAxZzNQaytqYWJhSzNoLzRKbDNsd0I2cktLbmFvNjZJQlEzRk41SUtj?=
 =?utf-8?B?cTNFTjdCc3VrL2RQaGNBeGZpN0o4L1FrdGo0ejVOQUxkYUpLQkZYOTJ6V1RZ?=
 =?utf-8?B?aHkzNnVaOG01RXlReDlRVGlQL0FKR1VPYTVtbTgyOVdmbWlucHY0VWcxOHow?=
 =?utf-8?B?bmFKSkwvTUdqZm1pbGc2U1RpM0crOWd4amdIUTczTG9mU2hsak8zSDZOSExD?=
 =?utf-8?B?c3dTbVBvUFQyc214ak56cHQwengrT0RZUW1lTlBEeThQWk1laGhRNEVwQjY3?=
 =?utf-8?B?c2NLL2YxaGZPVFJXbHllTU9SZVJQV05TMlBYQjBRNzZHb21JTE0rdU53ZXJk?=
 =?utf-8?B?TURmTTRhenQ3MTRlaUQzRVpjQkpLTkFoZmtsVjcwY0lTNWwzaWdNZXN3T3d2?=
 =?utf-8?B?WFJHUm0vV3U3T01CYUNKVFpCL3NkS2hIQjRPeXJETkhYZFhxTWxRUEdEM0ZP?=
 =?utf-8?B?QUV2ajN5ZkZZSzF5YWRIaDZQa3pqcGYzSmcxVnlGUERKOFpWMDMxdHRlTFA3?=
 =?utf-8?B?NzZtc2I0alpLdzlJdFF3UEtyWVV1WDVueGRRQTVCMnVrdGdLRlNEMmpqNUJs?=
 =?utf-8?B?d2E5L0hPWWI1WGg2RWxUQTNRZStsNFZyVnJMWDFSTnBnU0lEcElKdjRHeUZj?=
 =?utf-8?B?RGVuQmVmdnAwa213YmVLdElaYmhNY3EzTjJoVUxyMm50NjhUMWhUK1IwOU5X?=
 =?utf-8?B?QXp4TmRQRzl2OFlYTWprZE9ZQzZjbFYvNmVab0laUFpXTHg3bUEwKzk5ZXI2?=
 =?utf-8?B?Wi9UNzNiZjh2bmJ3K05Fa0JpZEdROUlkQzJ0dnpCbWF3cDBRV1JBZ1RQREY4?=
 =?utf-8?B?L0RqMnhTM0xVYTlIT2Vwb1dRTU04WW03bmZyd2FxTURhSDNUcVhadFpHQTcy?=
 =?utf-8?B?MVlDZnZSblZ1bzBKNXdMeS9iZmVKTCtIYTUySUQ2Y2dWeE5hb1NjT0h6TXRv?=
 =?utf-8?B?OWE4V2hHM0RGSy9mUm8rQ2RMWk5oS0hCSWl6ZnhXejJmbDA4N1Z3Wm4xZFF0?=
 =?utf-8?B?QlpLZEpwS0psRSs4aHRmcnBka0tmQW0zcVR0MG1jOHpDZjVnb2tmNDFpQU9i?=
 =?utf-8?B?UUo4N0I1NlBlM1dCb2J0cmtkeVVrUlZtd0FXSGc1bGtCKzd3VTkxR1ArQlV0?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31CF3861C39A994DB38501F4F667C123@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9c6aa9-e93d-4ecf-68cb-08dac233d945
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 09:21:57.0515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PN3HdHBpIMI6rECgw7hc50SzrTeLzsA7FDlC7DXSael8oFrfw+zdjWV+86O1MwekaMQepwYWjbOfhhlo+LL6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063

DQoNCj4gT24gOSBOb3YgMjAyMiwgYXQgMDc6MTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOS4xMS4yMDIyIDAzOjQ3LCBIZW5yeSBXYW5nIHdyb3Rl
Og0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogRWR3aW4gVMO2csO2
ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+PiBTdWJqZWN0OiBbUEFUQ0ggZm9yLTQuMTcg
djMgMDkvMTVdIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9zdG9yZS5tbDogZml4IGJ1aWxkDQo+Pj4g
ZXJyb3INCj4+PiANCj4+PiBCdWlsZGluZyB3aXRoIER1bmUgaW4gcmVsZWFzZSBtb2RlIGZhaWxz
IHdpdGg6DQo+Pj4gYGBgDQo+Pj4gRmlsZSAib2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sIiwgbGlu
ZSA0NjQsIGNoYXJhY3RlcnMgMTMtMzI6DQo+Pj4gV2FybmluZyAxODogdGhpcyB0eXBlLWJhc2Vk
IHJlY29yZCBkaXNhbWJpZ3VhdGlvbiBpcyBub3QgcHJpbmNpcGFsLg0KPj4+IEZpbGUgIm9jYW1s
L3hlbnN0b3JlZC9zdG9yZS5tbCIsIGxpbmUgMToNCj4+PiBFcnJvcjogU29tZSBmYXRhbCB3YXJu
aW5ncyB3ZXJlIHRyaWdnZXJlZCAoMSBvY2N1cnJlbmNlcykNCj4+PiBgYGANCj4+PiANCj4+PiBU
aGlzIGlzIGEgd2FybmluZyB0byBoZWxwIGtlZXAgdGhlIGNvZGUgZnV0dXJlcHJvb2YsIHF1b3Rp
bmcgZnJvbSBpdHMNCj4+PiBkb2N1bWVudGF0aW9uOg0KPj4+PiBDaGVjayBpbmZvcm1hdGlvbiBw
YXRoIGR1cmluZyB0eXBlLWNoZWNraW5nLCB0byBtYWtlIHN1cmUgdGhhdCBhbGwgdHlwZXMNCj4+
PiBhcmUNCj4+Pj4gZGVyaXZlZCBpbiBhIHByaW5jaXBhbCB3YXkuIFdoZW4gdXNpbmcgbGFiZWxs
ZWQgYXJndW1lbnRzIGFuZC9vcg0KPj4+IHBvbHltb3JwaGljDQo+Pj4+IG1ldGhvZHMsIHRoaXMg
ZmxhZyBpcyByZXF1aXJlZCB0byBlbnN1cmUgZnV0dXJlIHZlcnNpb25zIG9mIHRoZSBjb21waWxl
ciB3aWxsDQo+Pj4+IGJlIGFibGUgdG8gaW5mZXIgdHlwZXMgY29ycmVjdGx5LCBldmVuIGlmIGlu
dGVybmFsIGFsZ29yaXRobXMgY2hhbmdlLiBBbGwNCj4+Pj4gcHJvZ3JhbXMgYWNjZXB0ZWQgaW4g
LXByaW5jaXBhbCBtb2RlIGFyZSBhbHNvIGFjY2VwdGVkIGluIHRoZSBkZWZhdWx0DQo+Pj4gbW9k
ZSB3aXRoDQo+Pj4+IGVxdWl2YWxlbnQgdHlwZXMsIGJ1dCBkaWZmZXJlbnQgYmluYXJ5IHNpZ25h
dHVyZXMsIGFuZCB0aGlzIG1heSBzbG93IGRvd24NCj4+PiB0eXBlDQo+Pj4+IGNoZWNraW5nOyB5
ZXQgaXQgaXMgYSBnb29kIGlkZWEgdG8gdXNlIGl0IG9uY2UgYmVmb3JlIHB1Ymxpc2hpbmcgc291
cmNlIGNvZGUuDQo+Pj4gDQo+Pj4gRml4ZXM6IGRiNDcxNDA4ZWRkNDYgInRvb2xzL29jYW1sL3hl
bnN0b3JlZDogRml4IHF1b3RhIGJ5cGFzcyBvbiBkb21haW4NCj4+PiBzaHV0ZG93biINCj4+IA0K
Pj4gTml0OiBUaGUgZm9ybWF0IG9mIHRoaXMgIkZpeGVzOiIgdGFnIG1pZ2h0IG5lZWQgdG8gYmUg
Zml4ZWQ/DQo+PiANCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZp
bi50b3Jva0BjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IFJlYXNvbiBmb3IgaW5jbHVzaW9uIGlu
IDQuMTc6DQo+Pj4gLSBmaXhlcyBhIGJ1aWxkIGVycm9yIGluIGEgcHJldmlvdXMgY29tbWl0IHRo
YXQgaXMgYWxyZWFkeSBpbiBtYXN0ZXINCj4+IA0KPj4gWWVzLCBnaXZlbiB0aGlzIGlzIGEgc2lt
cGxlIGVub3VnaCBwYXRjaDoNCj4+IA0KPj4gUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiANCj4gQWZhaWNzIHRoaXMgcGF0Y2ggd2FzIHByZXZpb3Vz
bHkgcG9zdGVkIGluIGlzb2xhdGlvbiwgYW5kIGl0IHdhcw0KPiBhbHJlYWR5IHJlbGVhc2UtYWNr
ZWQuIFdoYXQncyBsYWNraW5nIHRoZXJlIGlzIGEgMm5kIG1haW50YWluZXIncw0KPiBhY2sgb3Ig
YSBwcm9wZXIgUi1iLiBXaGVuIGl0IG5vdyBpcyBwYXRjaCA5IGluIGEgc2VyaWVzLCBpdCBpc24n
dA0KPiByZWFsbHkgb2J2aW91cyB3aGV0aGVyIHRoaXMgY291bGQgYWxzbyBiZSBjb21taXR0ZWQg
aW4gaXNvbGF0aW9uDQo+IChpdCBsb29rcyBsaWtlIGl0IGRvZXMsIGJ1dCBhIGNsZWFyIHN0YXRl
bWVudCB0byB0aGlzIGVmZmVjdA0KPiB3b3VsZCBoYXZlIGJlZW4gYmVuZWZpY2lhbCkuDQo+IA0K
DQoNCllvdSdyZSByaWdodCBpdCBhbHJlYWR5IGhhcyBib3RoIGFja3MsIGl0IGp1c3QgaGFzbid0
IGJlZW4gY29tbWl0ZWQgeWV0OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
eGVuLWRldmVsL3BhdGNoLzVhNDUzMzkzZGFkMWRlODI4NmZlNWRiMTY1MDRkM2RiMjkwNmVlZjgu
MTY2NzUwMDk3MC5naXQuZWR2aW4udG9yb2tAY2l0cml4LmNvbS8NCkkndmUgYWRkZWQgdGhlIGFj
a3Mgbm93IHRvIG15IGdpdGh1YiBicmFuY2gsIHNvIG5leHQgdGltZSBJIHJlc2VuZCB0aGUgc2Vy
aWVzIGl0IHNob3VsZCBiZSB0aGVyZS4NCkl0IGNhbiBiZSBhcHBsaWVkIGluZGVwZW5kZW50bHks
IEkndmUgcmViYXNlZCBhbmQgbW92ZWQgaXQgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVz
ICh0aGVyZSB3YXMganVzdCBzb21lIHdoaXRlc3BhY2UgdG8gZml4IHVwKQ0KDQpJZiBpdCBoZWxw
cyBoZXJlIGlzIHRoZSBjb21taXQgaW4gaXNvbGF0aW9uIHRoYXQgY291bGQgYmUgY2hlcnJ5LXBp
Y2tlZCBvbnRvIG1hc3RlcjoNCmh0dHBzOi8vZ2l0aHViLmNvbS9lZHdpbnRvcm9rL3hlbi9jb21t
aXQvZGE4OGI0MzhlMDNkYTM2MjEyZDA3ZDI0ZDY3YWIxNTFhZTI4N2Y0ZQ0KDQpCZXN0IHJlZ2Fy
ZHMsDQotLUVkd2lu

