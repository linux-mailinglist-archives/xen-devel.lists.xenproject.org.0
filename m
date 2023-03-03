Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456A6AACDE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505497.779539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwZ-0000sX-8K; Sat, 04 Mar 2023 22:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505497.779539; Sat, 04 Mar 2023 22:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwY-0000hs-WD; Sat, 04 Mar 2023 22:01:31 +0000
Received: by outflank-mailman (input) for mailman id 505497;
 Fri, 03 Mar 2023 00:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqmn=63=wdc.com=prvs=4197e97ac=wilfred.mallawa@srs-se1.protection.inumbo.net>)
 id 1pXtcH-0001mN-Qh
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 00:49:46 +0000
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 472db9cb-b95d-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 01:49:41 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:49:37 +0800
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BN6PR04MB1010.namprd04.prod.outlook.com (2603:10b6:405:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 3 Mar
 2023 00:49:32 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:49:29 +0000
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
X-Inumbo-ID: 472db9cb-b95d-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677804581; x=1709340581;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3c2lLoLKrIgqpiLPhfOUf+iwlyAlQERnRDKmPu4qSms=;
  b=I0NGydZ0oBIndRxU+kVaYgd6zZyzEG0EsDhSFvEzCIieDzgPaQj0/Wxg
   Zw9P+86Av/oI1eEOUopLsYu0j8mIb0K9L7MGzToKcRAsKMPOB48ESRKAa
   EgPn7KJ0rsEVMIrn3+7g4m0UUL+W7XoV8I6jdOgZqwnfdiolcD8SAZcxv
   uqyZfVRMdUos0fS19IR6SRwjt9nolrqo4WPU3XtLS06QZhQIHfi8lIP8f
   8bjddtz7JOWv8+KJqoGAz5eDHeqn2gQSQD/HF/RpWxNoPSEW4AT4Ch0cO
   whadbO0s6dk/i4WdrrixaAxNVZerPrB855l1+YCRY/sqwyZNunVkrj6Xe
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="229646082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsRddNaPlTVBFYEHBRzoGkOK2GwALQJ9VUGFRhtO4vRtpcH+/mUAFGMy8rtqWZxKKqU0taB3WJEyM8xtZ36/XbFVyQfc3OEPLIu3STr0wetb4ap315zIccRuChI6oNK0lnRXOrSfHutKAFXXqLOZY3s9Z8rqi0CxA9V67kTgJUfMQ1B+d7yxVVZHOj/9Rht4Y4CPnwVvxg8Clp/yzfT/xhuK2xCE+80xxGFtlwJWb5eSYKtfFcPWNSBD0hi/NpEwro5kVra50CUOjeT+ioV3hMa0n0ryOmzJOz3YvfvgKkVfwsNV4nLE+K9QKPQrbd7Rb+nB/abIxUqAD3ju4CfoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c2lLoLKrIgqpiLPhfOUf+iwlyAlQERnRDKmPu4qSms=;
 b=cnfEesFK+be5dkiUfN7tCmSPmn3303LhmTJd9oUCGW8H2K/7bdhvVG8tCXUTW6k/YNomVLJtdpLbpSbZaZqY94Pe6IETbFHo8tOMTfAw0RuRN+/8BID8rJ9xvlFMiNi5AykfH5zaT/0mymttFxHG0q59CwCJvQf+FtXQ21GrpX1DKIuU8WvcVk7aB2azlnNMxfA4tlYvTC6IJVqKCN4J6jNVRc1y50ZTQyLUlquQH0P97Qy1l0pDLfMEW02h82Ebar1foyQ7KM42BEJxHOyZB5/gIFo49NmS09SUuCXhkpIHAdTQYHgM4xK8RBWIgTB9YabPjB3Tkr+jBfH+TSXvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c2lLoLKrIgqpiLPhfOUf+iwlyAlQERnRDKmPu4qSms=;
 b=ofYC8UMoiscY0qIjizIqsgL+LVcL39TGZtQTemS3h7Bl2DCYxtdQ7y7wACAKvsQq00JBym1cr3vwvE+nzZm5or+rJRfDEXOj5wHQjLuIreABpsjajkfj5SWOVZlEizNgzfv3BVyutoxF5UBrb0ZeYcyre70BqfSPS/dbIOKUJZw=
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "thuth@redhat.com"
	<thuth@redhat.com>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "libvir-list@redhat.com"
	<libvir-list@redhat.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "mlevitsk@redhat.com"
	<mlevitsk@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"reinoud@netbsd.org" <reinoud@netbsd.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/6] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Thread-Topic: [PATCH v2 1/6] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Thread-Index: AQHZTSS0My1atrW9yUeGJv0kKNDfAq7nyMiAgABw8YA=
Date: Fri, 3 Mar 2023 00:49:29 +0000
Message-ID: <92f1c28c4cb43f225e77e13565d9878900be3cfb.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-2-thuth@redhat.com> <ZADlWR/jmGsaPGh0@redhat.com>
In-Reply-To: <ZADlWR/jmGsaPGh0@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BN6PR04MB1010:EE_
x-ms-office365-filtering-correlation-id: 1795be8b-892b-4166-80c5-08db1b812576
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uL0NVor8/H51RgB5b1Dm69IVI6fj+OrBopTsKVX4SpI7iIoVu+LaQrPbPmjtzR7sL2w/wBBCK7jgh1SL9UAFivX/aBNF/P6J5Qy3czxJLg6cRLHHoB83/psxLn3LSzQmsy+aM4Fw1s+1TNjGvcjm+E0lDuv1AslMbaDxC2Bvo9g853mC6LdhzdOFJCPwAbwYvW6cwcpySOaNUoq/f/N7ogdPn+ufEImPlYXKNBxlTqw9aHjqxWBGYx7vbqzTCKUEqOX1Hcto0OxFALt+aD1T/Tj8IE0tVPn8amhfLs47YSNGuSjEgnXc2M+PmUdh1guhhbSI0ipmB/PFZ2n9SA+AnTGN2zjPmQTpPSsxETtZlF9yTrI/X8bSECVhAfJFUGhTpwCKYGfkUrRXhBRbf2kgqQo0EojHcSCumlI3DoRdGwcXRufNO8GQOfl5OkF3uP5gKHRfVwINVRZRJWwB5BLLYPl+5RrGXvflQHZufoopvVfxSLcYgeVGdL2q25pCYCEFVn/FWNuX5ZB9SXRbZmWYx9EDCU+tiKS0ri6PK/KeBbsgmLvcJi59Mc1vyypDZurOy6Elr1AwKXYgl4kxstdADuG6EbY+vmwqGPGWZUjslRLJB3CHkePpmP4bBEtBBbxMauDGMCCliEjeRS2sd5HxzcX1dplKPmWOuZ3cw6UcW4cbsclfRi3cEqGrwaw4AylM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199018)(478600001)(110136005)(83380400001)(41300700001)(66446008)(66476007)(76116006)(54906003)(66946007)(91956017)(8676002)(2616005)(66556008)(8936002)(4326008)(5660300002)(316002)(186003)(6486002)(26005)(38070700005)(6512007)(71200400001)(36756003)(64756008)(966005)(122000001)(82960400001)(38100700002)(6506007)(44832011)(86362001)(2906002)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVdKYk9tRExYQllXUjVzUFczaFJWRkY3THpNNi9GWGMvQzFjU2Fpbjc2QlNS?=
 =?utf-8?B?RCtieDRHUlpudnB2bmkvRTdIRVhCSzY1d0xTQjhpdmRWVEttWWlkczhHVEhZ?=
 =?utf-8?B?RlFSZENRZ2tUN3o1VmZzaFdkcDZZSlVwd01QU0NzYUdSU2piVWRpZFFzVXEr?=
 =?utf-8?B?VitEUm01U0VGZlY0dllydnAzMnVIUTRMckhBSGFDSTVCUHVIT3Z2dUlpTVNt?=
 =?utf-8?B?dFJRbCsvQmxUc2MyeHFqaGxNbEt3NDI2ZGc2ZGI1am5GYTZJVEdrZGZSVTA3?=
 =?utf-8?B?OEtiZU5pZDljQjQySlBvUkxCdjVyUGxsREdUYm9VK1Q2Wll3Z3FBb2lrRS95?=
 =?utf-8?B?NVdGbWdUTVF2RGVkYVV5RGFLVkViS0xkc0dLMFZZOFhkMmFCVTNTQTNrbmZ6?=
 =?utf-8?B?UEpWZ29HUlVOemFDakM5dGROak5MVTlRY2FRYzZib3VhSUFTeVVpbi9xYnhl?=
 =?utf-8?B?TjNVcWpBV1oxcUJSOStEODJOYzZrdUVMQnFIUTBxeit4dmFpc2k0UVppcXBu?=
 =?utf-8?B?anVDZ3FOOWNtd0J6S1V6bHh2QmVycXF4K05TOVlTZVc0b0NBeUdQK3REUEhG?=
 =?utf-8?B?azdaeUtxSjJ1d1c1R1NhMWRvVnQrWlV3OElOODdHdk1qWEdRY2tvVGdTdzRK?=
 =?utf-8?B?d0ZoNGF1VnBWUldTd0l3b2Q1SGdUY1RtTFpabHRIbWhRblgvWG9ZVWhJNFhj?=
 =?utf-8?B?Y28wQ08zb0lZUU8rY0VibG0yWHZMT3MrbWxmQmIxRnpyOENvREhlcWYrVW1r?=
 =?utf-8?B?NGMranVvNjZ3YlQzdFA4MjRqQ3dNMHNLeEV3dlAyU1E0SXptKzlEbnNYYWt3?=
 =?utf-8?B?WmNSMUlTSk1qRkRKWDlqZmZqQ25abHpjTytzSkdqRjB3Tk80K2NaaWFwTkxO?=
 =?utf-8?B?eXBHdXpneEVDZ3RGdVdKRzBhVUcwNENNYjFweDI3b0lUWFlMaklsN1RURmJ6?=
 =?utf-8?B?RHZkMEFvb3Z0aHNGM1A4bGw1NzdWa0VrbmhQbVhoMVY2bWNmdXdpSmFVd2dB?=
 =?utf-8?B?OHkwVjQ5UFMvQXRkaHIrRFloZkRyenpMbXlZT09WQ2M5bFhpRVRDSW9UMkFW?=
 =?utf-8?B?Z3pGWm5kNk1WOXlQeUtmK0NVTzhCQXJBZkdXYU9Leit6L2tCVHJkRjkvMkdj?=
 =?utf-8?B?cnptMURwKzBuTEJZV0k2cVQ4dVN1MVphb1J0eWpFQmNMTGsrUmpKL2F4aG5W?=
 =?utf-8?B?ZW5acHppdVR4MDlZOElPOHp1alBTOGNVL2FHODVoQlVoQWR0SlVzVmJxLytW?=
 =?utf-8?B?cXVOUkdBQTlLMkZwdWx0UTVhRHJrZUEzYjJaa1grTHpOeEVYTkpuUVhIWEtO?=
 =?utf-8?B?a1hrREdCRFlidDdtVFVFeGJnbFhweURJNEowYVpUVmdadjQ5cTUyNVB0RE93?=
 =?utf-8?B?eEVnZllmbFdvcXExM3I4WmM2dk1XMnZSRURTZlRDOFpzNnh6WlUvR3k0STJW?=
 =?utf-8?B?Y1BiN2gwTUJkL0hJdU1UUDBpaHhxakQ0OVFBbTRlWWRFMmp5OC9vK1o4VWVm?=
 =?utf-8?B?YVBCSDA2UzNFenh3UnQ5dVh2SkZCVURYOUZvY3BSRk9sbVBvM3VjN1EreDA4?=
 =?utf-8?B?L2ZkTFJsSTIzcGtQay9LQ0JsYVQ3TkZlNXhJNUg1Vm04aWhIa0psRkFKazFM?=
 =?utf-8?B?NkJCUWRhazl5enRITmJTSXBqQTlvMU00clg0QndmMGFrOVBTRlhQNUlqaGRy?=
 =?utf-8?B?UUhRWThFVEZjaG41ZHI4aUNqcGZlaHRVcGRFN29XRnJjKzZuaWdVMXNPR2Vs?=
 =?utf-8?B?MjJ3R3BsQk9KWkxzaEhCMTQ2VlM2Q2FhQ0RvZ2w1engzYXorbmd4TStyNXRK?=
 =?utf-8?B?cXRDeTF1b1JieUthUXdkalkzb2svRDJMTkRXQzk3L3BENk5KaHZBY2lML1cx?=
 =?utf-8?B?bGgvd09zQ2xkdWNCUTlvWCtvL0Erak5XaHBZQlo5VnFpczd4aStjZE9MRmlO?=
 =?utf-8?B?WGRqQU1MN0J3enI0NUw1L1p0SGIzQmNZSjJ4QU9MK0hEV2JRRGMvbitNb25Q?=
 =?utf-8?B?WU41UUFUckxWM2t5VWpDL0VwQVEvUXRpWlVZMk5yT3QrRzEyM3A4T2xKU3FW?=
 =?utf-8?B?QWVrYzB6OFVwam9hdEI4MG5MbkFxQU90Y3FyWDVEUXdGNVFLMTQzcXRBZXJP?=
 =?utf-8?B?Z3NtbVVEMG5BejA5TG90Q2VGRVJ0YXM4elBqNTd6ZkZBQmEzZVZ5RnV1SGtJ?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D24C37AEF74A442A68B7BB0BAFBB1F8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DYSDHBhC1d81/LqY15XpMq1MQSj6BqrAXR18LMc+HMq7QyqOxfvEPbz4VtBJJP+NTcVWycyuPuJxbDoj3mdgroWFbhoZsbXWGWASzJKMBrVBjrxMlkN+SeudMRNgWeN62uRPQud7ONlwO+ARaxTUZKQcCAOrC4Nv/jiXQ2q0jUQ7fwsXE5Y/73xJBpUlfyPO/l6Ro0SX9O2e9YzkQb2MYcq7XhRrOrYw7ECUFGaA4vxoNof0/tFHpv5mCRXZPfjB/hxyc4aw/3VvoWEARqeAqh2lqSOL50GiZWj0bkp4upwtZ0pu2EdGv1NFRDd6nC+5FnhLDmA41emr7sLWsely0pt0A1RPgXwW1x1uzZ0Te/UKdNxLOwWutxMSGYhaX/icxsHypK+bYn7ddAcoezG5LhFqgsGR5OSCHtbAdq+4cseZyNM7As50YVNGwXWDnWrilKyZP6dinJusHPdQZf5mm0+ZeUoAaKdOFolKRXNIBFcvgGuG913vXmp40xumKDvgw3OWASuj1Y3nQOEWTTVwCUSGL0VVDaLVQBT2cqfdAMcJENAvBxeEnpg/Ss66eRDIY+jIOO0ckMGgPHe47RLbwh2JKFaFb8cPASV3b3W3M/324SQHma59K8/85cHltsW10otoqwlREvW1v5eKi2zD0C+LLwKDiK7+qMFJ/e9VSaAvk4bq8ZkxAAY85Pgq7aSIAaeY2XDB5X3rFwBjx0hvfnIf+OwJ/QgR0UXNCnv5cxo1LLFQhcoh+Rk7//6l9bSJz++srpT4fazienUSNIocoApyIV44Jn3+b2e2YcxDh+CB/p1GBnMvpQ3JZydcqW3Gg9UDbUmmWUh0Rem+tZwHKUWtOULXOPCf5ByDhl6/MwXWQ2OM3RZbzPL7DANiyD9aMsYmPMr9bwd9PTm02ryGr9tR6JCXcbaGsRFmIdx/o50=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1795be8b-892b-4166-80c5-08db1b812576
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:49:29.5842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHOrP+ZHmkviBbUS0goP0bS+jscdTQfpIV/N34t3CPNB6fGMhomSTlcP8XddMNihXHZ0xYuR+5siMP8xJWjpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB1010

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE4OjA1ICswMDAwLCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdy
b3RlOg0KPiBPbiBUaHUsIE1hciAwMiwgMjAyMyBhdCAwNTozMTowMVBNICswMTAwLCBUaG9tYXMg
SHV0aCB3cm90ZToNCj4gPiBIYXJkbHkgYW55Ym9keSByZWFsbHkgcmVxdWlyZXMgdGhlIGkzODYg
YmluYXJ5IGFueW1vcmUsIHNpbmNlIHRoZQ0KPiA+IHFlbXUtc3lzdGVtLXg4Nl82NCBiaW5hcnkg
aXMgYSBwcm9wZXIgc3VwZXJzZXQuIFNvIGxldCdzIGRlcHJlY2F0ZQ0KPiA+IHRoZSAzMi1iaXQg
dmFyaWFudCBub3csIHNvIHRoYXQgd2UgY2FuIGZpbmFsbHkgc3RvcCB3YXN0aW5nIG91cg0KPiA+
IHRpbWUNCj4gPiBhbmQgQ0kgbWludXRlcyB3aXRoIHRoaXMuDQo+IA0KPiBUaGUgZmlyc3Qgc2Vu
dGVuY2UgaXNuJ3QgcXVpdGUgdHJ1ZSB3cnQgdG8gS1ZNLiBDaGFuZ2Ugc2xpZ2h0bHkgdG86DQo+
IA0KPiBBc2lkZSBmcm9tIG5vdCBzdXBwb3J0aW5nIEtWTSBvbiAzMi1iaXQgaG9zdHMsIHRoZSBx
ZW11LXN5c3RlbS14ODZfNjQNCj4gYmluYXJ5IGlzIGEgcHJvcGVyIHN1cGVyc2V0IG9mIHRoZSBx
ZW11LXN5c3RlbS1pMzg2IGJpbmFyeS4gV2l0aCB0aGUNCj4gMzItYml0IGhvc3Qgc3VwcG9ydCBi
ZWluZyBkZXByZWNhdGVkLCBpdCBpcyBub3cgYWxzbyBwb3NzaWJsZSB0bw0KPiBkZXByZWNhdGUg
dGhlIHFlbXUtc3lzdGVtLWkzODYgYmluYXJ5Lg0KPiANCisxDQo+ID4gV2l0aCByZWdhcmRzIHRv
IDMyLWJpdCBLVk0gc3VwcG9ydCBpbiB0aGUgeDg2IExpbnV4IGtlcm5lbCwNCj4gPiB0aGUgZGV2
ZWxvcGVycyBjb25maXJtZWQgdGhhdCB0aGV5IGRvIG5vdCBuZWVkIGEgcmVjZW50DQo+ID4gcWVt
dS1zeXN0ZW0taTM4NiBiaW5hcnkgaGVyZToNCj4gPiANCj4gPiDCoGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2t2bS9ZJTJmZmtUczVhakZ5MGhQMVVAZ29vZ2xlLmNvbS8NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGRvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QgfCAxMiArKysrKysrKysrKysNCj4gPiDCoDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+IA0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFAu
IEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NClJldmlld2VkLWJ5OiBXaWxmcmVkIE1h
bGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4gDQo+IFdpdGggcmVnYXJkcywN
Cj4gRGFuaWVsDQoNCg==

