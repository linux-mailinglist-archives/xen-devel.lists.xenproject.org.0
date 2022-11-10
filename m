Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8A9623DB1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 09:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441527.695644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot37x-0001ch-1F; Thu, 10 Nov 2022 08:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441527.695644; Thu, 10 Nov 2022 08:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot37w-0001Zq-TM; Thu, 10 Nov 2022 08:41:36 +0000
Received: by outflank-mailman (input) for mailman id 441527;
 Thu, 10 Nov 2022 08:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sgDV=3K=citrix.com=prvs=306f7a1b5=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1ot37v-0001Zk-B4
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 08:41:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77102eb5-60d3-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 09:41:32 +0100 (CET)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Nov 2022 03:41:06 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BL1PR03MB5975.namprd03.prod.outlook.com (2603:10b6:208:31a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 08:41:01 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 08:41:01 +0000
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
X-Inumbo-ID: 77102eb5-60d3-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668069692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TXednF7H5KKFrI6WoKZEcOzsDTsiotrORWgCBbkEkpA=;
  b=WSdvVBYXFV2uUOjjQZNZyUio194t6XKnK8pF32Q7hKEtVz/iJmhOGqWw
   H1GaqXZuNb0O10Vq4EAbd5uUJRx7H/I6o/Mm9dTa7fQFlmwA/tdu/3Zhd
   DY+fknqCvhw6Ig0YWKbeyjEpRZu1Wub8eYqOoPsN6dPZEYxjJ+lGc/mbL
   o=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 84139638
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MwCAw67pvyxWjY/jYp2gBQxRtPfGchMFZxGqfqrLsTDasY5as4F+v
 mNOD2iAM/feYGX3KN1/bozk8EJV75DdyNcwHgtp+SgwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 fMgKioiT06/g924zfGhb7R2je07I5y+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otidABM/KMEjCObc5VhEeDu
 mPP+SL9AxcWNdO3wjuZ6HO8wOTImEsXXapCSOTjp6Ax0DV/wEQOBhk1FnKdmsPloXObd+9kM
 GlN3zIx+P1aGEuDC4OVsweDiF6JuAQNHeVZFeIS4RuIjKHT5m6xBHUATzNHQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt79D9rakpgxnIT9IlF7S65vXqHRngz
 jbMqzIx74j/luYO3qS/uFzC3TSlo8CVShZvvlmOGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWA6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:OhIzOKCxCKI2UPblHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
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
X-IronPort-AV: E=Sophos;i="5.96,153,1665460800"; 
   d="scan'208";a="84139638"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksLfTf9WY/n6jycoMKvWcFgF36SbKLynvJ6k3qvmxAJr7ZQkROnxZzNoXoREZwvaowUoEDuAXP0iJ4jxWaFwl54oRISZgL0gWvJqU2nW7LOt/PJdmFIZ8Wo2Ya45ZqWIDaYiKPN+vn2ttQiQQ8j08MsJpohXfCrgpbjBYHGvDX+0EVZtm5e+V93aHQHjgAxhaDf9BWSb+ANj/UjOL9/bjiBmlAQkxTRhRKGyw/NJU7TkmCfQyt3jWU4WExV2CpH/qp9PMOTM5G9C+PLYnx3oJ6xmqlDxh/AhqmZPPk74Nx0uCfohkKh+kBfsOKZJPohjQf4kOTBs8z+/jFEdUJwrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXednF7H5KKFrI6WoKZEcOzsDTsiotrORWgCBbkEkpA=;
 b=KYrDqhbfcmV83egFnZfZEtZINR+Qd3TT4UiE/6bPb1+UQDoBhQLfH+zOkbLNjg+cAlCr3wlvHDG6VmXKy4a3Euj94JosRr/EtVwwr0jLRSVxEN4wYIToKeEnJ1DbhSD2EgPkMCMJZWJou83mXD7h5cE5emcZ/+AVdKsQsGJE/MGoV+So+hdobSOz5Pt1tqhKzToORwjt2eGU4dPSjWfK8Z+AgrGVN1LHKnN2C/0zkGL9vWxtRyq+tpvwJfxI4aiirdq5esQUfsyF9USdFfqX14Gp0Eq4EN2Bj9iiWqL91LVKBKGjuaLUmwUNJjv5T7wlNMr2IMV79URfsibss0gIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXednF7H5KKFrI6WoKZEcOzsDTsiotrORWgCBbkEkpA=;
 b=UdNYPSwg/uMZIOcJrnHhsoM8dETNQLsSTni/R5Z15+oMu8vewXxE7KRrjm/KmJV/njaRVfdrsFqnEbrQ6mhEV9kIzMSdcsW+SQD0ULBUJPO7+G+/PD9UD3SfZ4B+a1trfHiN5MztUtqahcxTAs5y626SxaKbv4ak4DK5PSqmjAI=
From: Christian Lindig <christian.lindig@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, Edwin Torok <edvin.torok@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fBVQkM1eqLakCv8k675veNsq41MEgAgACx3ICAAfcdAA==
Date: Thu, 10 Nov 2022 08:41:01 +0000
Message-ID: <DF0BBACD-9D12-4B60-86F1-243A6018F8D4@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BL1PR03MB5975:EE_
x-ms-office365-filtering-correlation-id: 0332440d-142e-4432-b2c7-08dac2f74bd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eEOU5jP419r1LcniE9r/ItC5DuBS149cvOTXmOSdger+cE32Bhg8OkIzWqbIGYtd8J4GbYICGHMLR6XJmDtc6wMsAJxe1XmRHlVdv2Sv1m/KldnNL1dbgVXb20TAhrQFsHC6RtVEQOYXN/L1L3oqzMS0XDSvALoJHdyMe0vP9eOuqnyKe8TALFlVXZHOXf4H2Rw3a4081k4SNlqYwLhF0eekNoIlVvlpWLFUPqaG6u3BdMCwhsga64u6V0Qp2vx47Fazs7CgXmOu1LOsqZNS80m9VYrpQN8VpIcSW0AhAcbX0Fu2zhuJvbVc+cLDPLsYOR+2ucoGkziOKLuLRhcQQQYA71VQweC6ZCgJv5KOuyw+xap3eUk+Pxj2yuMEUsOCGt7pnVOz+pIXeP28Zv5jOSX6RCN6AjjYWhMikr9x+dD5O4UicB3JU7APQpTF19qkwhxkRiq5PxPreQZ71Z2Fae++X/9JOyRuFEEqonKaMJubTFqSbUwEq7vrxu9Vi6DFlavEnx5lgBcW/oIorwSu5qmLxf4iEabddurfRQDmhKws/jOYv04KpaoUkM2WtGi3uTHAxV8KdpGR3OzqZvnvBJMKw+UpnK2WCcy4sGOqBlyRHxHvfjmBndhtD9otZ4GXiLMWPiO7nrq0dj36eB6l9y/bkr+xHtnGEl2Lqi4nn6cEBjO9hbwN7kuFl1DrFhjG0PFVe+2qfIOV6B+MFCeoF8vBNmnjEXjWDEgbrh4J2uUSsd+Xmipzx4muyRg7xQOtkvI/KQB7AOVZv4NYpgNBbZu61hViupd58G2LXe5jBGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(36756003)(33656002)(82960400001)(38100700002)(122000001)(44832011)(38070700005)(83380400001)(86362001)(6512007)(66446008)(2616005)(6486002)(91956017)(53546011)(76116006)(186003)(66556008)(478600001)(71200400001)(54906003)(316002)(66946007)(64756008)(66476007)(6916009)(8936002)(5660300002)(107886003)(4326008)(41300700001)(2906002)(26005)(8676002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVNMZnVESTZ0UlB6RjF1ZjI1Z1ZXMnFWMFFQOEd4bFEzOCtXcHlvMXc5dE1u?=
 =?utf-8?B?Wkw5NWRyVHZRNnVaaHJweU1PbDBHTUdWZ2JqK3cyMFBpSHFSOElDdDRaMUFH?=
 =?utf-8?B?U2JMN01QanNidmVjWTdvcHRSM0lDdGtPRGd0RWk1Q2tMNE45VUhsQVBWeG5O?=
 =?utf-8?B?YjNzSVV4ZkhWUkVFUlFjSkI2V0tvZDlQZW5oRVZFWFBNWmJYUnk5WjhyZE1S?=
 =?utf-8?B?RXZJZ2ZqUjFDNXFmdUE2VTBrblphSFdSMU5iMWtGVm9POTUzSGtZMWxIRXAx?=
 =?utf-8?B?dng0S1MyU1k0M1NOQ1pZSTVWYU1rRlV3L094djE3N1drdTFCY3BRVmpuVzNa?=
 =?utf-8?B?c0s2VmdNRzkxVWlZSjVrV202a2RoVmRBR0ZwWUg1bmNvNWtRZ2Q4VEhqWG8z?=
 =?utf-8?B?VjQ3M29ybWpkVklpWXdPak50L0p0T1ZFNDhtYmZFNzZTOWNWNFljMDlOdmha?=
 =?utf-8?B?ZmlwR0duQUI1V2VjbzNwKzRYdktLOENqbUh0cDU3ODJNdTBpdVNEK0NJSXhF?=
 =?utf-8?B?MlV1ZTlMWXZKTjVqRlQ1UjdPU053bGd5ejJtM1dnZndLai9VRjZqbWMzRGd6?=
 =?utf-8?B?Z0J3OUhUVytBWmFOcWpCaUJaYkV0QjlFSVU1SUdTN3o4M2tCQ1ZvTmJPS1RV?=
 =?utf-8?B?ZkRYWlBFWk1XNVFOREt1QTByVWliZ05ZcWdadnFuc05mbXAyUXduQ1ErYmg5?=
 =?utf-8?B?dW5GTlovRXB6WGZjd2xSOVR2bitGS1l4d0NubW1zL0VONGNaazRDNFk1T0lk?=
 =?utf-8?B?NzF5aDYzMkZVNndKek9qZTlkMnhIUFJwQnpueEJFeUlEUnR6di9RcFhZcVR6?=
 =?utf-8?B?TUFIdEFndjRGWnp5cnVkeXB3cnQ3SkhOZUpraERoNHJIa0JlNUZOTG5EQkNJ?=
 =?utf-8?B?L2toN1F4YnVOTmVvcmVWcS80MVpubXZVZ29WVjJrWWduczJWaFNJREJ3RFZQ?=
 =?utf-8?B?KzdKSFBQbDRZd2JoRVFiQWdpL21wZUVrWnpaUEdPcnM1d1dUb2NpdnBndzBx?=
 =?utf-8?B?SzdqeG9iOU9FR2lJeGpVS2djRWVJK3ZRL05RUEt5VS9iSVBPYXpnb2NWQy9J?=
 =?utf-8?B?NW1BTEZMcHdEejZIWnRlQisyR1hCOFhGWkkvcnpLKzVoS1haNk94MTEvSmpi?=
 =?utf-8?B?Y29xcGg5dGs4eUdveS9FNC84dUU4aFdaTkVHOUM2Nk8yY1hoMTI2S3pWOHY2?=
 =?utf-8?B?NHdSMnFFY1JDbGs3eEZDUUltUnREZ29LZ3J1NkI0MHBqVXA3REQ0VWFMeHdT?=
 =?utf-8?B?NjdnWkpDNS9yUjhYMmh4dXZmWDJaNkxYVjgvNDlybnhaOC9ZY2RpRk53RHc3?=
 =?utf-8?B?NmVGTUl0VXBHUzFKeXBXeU4xck1Jd2szdnRYQ2ZrZld3TStUdGxDeUZvZHdk?=
 =?utf-8?B?ZmcrS3BlL1ZnaWNsbmR0aWVLR2c4dEk1eTJJc2lheGZCYjRMM2R6cEM0K3lN?=
 =?utf-8?B?TE5GbzQ1NndxVEZHdDRkdlZPTWN1cFJKVC9YRkNHMlpPYVdqdHFQTi9LQW84?=
 =?utf-8?B?VFVPVDQyeHBXV0NHdmxjbGFXaUdEbHNidWJKVEVMOUhpWlluUzNVYmRsUW9k?=
 =?utf-8?B?WWE3N2wrMjJSNFZnV2xiUlczTzFSdUpNNlRKdkYwSFRnaklNcXpzSjZhYXR1?=
 =?utf-8?B?ZFNUUlFBRE9xY1pZMzZZV1lnMkRaVi9MVTFnWTNyMlNkenozSzYwN3RaZEEw?=
 =?utf-8?B?R3VNNS9XWWF5TzBZdDBBWlppeUFXa2I0T3FsNWttTVQyVnZIejVKaWxOMnJY?=
 =?utf-8?B?OGhsemxnV01aZkVCR3A2dGFQbW95RkN6R3BpQktyTWJ6N3kxRXIyYmtBdm9r?=
 =?utf-8?B?SUJyVkl2ZE9HTjJDMExvNnJLazZIeWlQN2w3dFZsaGJXWWxMUDIxUjN1UGpM?=
 =?utf-8?B?SG01M2h0U2o2cUdmZ3NvdG5yNlI3V0RxZFNISUZLckRZTVlab3dPUm5JRWhF?=
 =?utf-8?B?QXVOQmxQanJOTEFna0Rmd2ZLMlZ6WkZGdWtlU1lwc0J0ekVoaFk5ajl4STBv?=
 =?utf-8?B?VUF5aDBTeGk1ZzZ4SC94di9Rc3VmbGNwQUhyQWFqTVd2NUo1bkJuWllUaXJL?=
 =?utf-8?B?VW0zQzZhL21xMjcwRjA5SFZIL0NmUnViUVdpNFdOVmJ1VFppK0VvU0RoVDFL?=
 =?utf-8?B?UUtMZ1dGRzg5Y1VUMmNETGRNUTZ5UUtBaGxXWlErT2U4WkFmbHJXeXVLQkxH?=
 =?utf-8?Q?UJHWD7gkOjbb0cS7GonxFhc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <219755DE25C70C49AB46A6D0CA02C069@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0332440d-142e-4432-b2c7-08dac2f74bd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 08:41:01.0819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLOVt+Rga+Gr5I77fAJkqWQnhZ2zcB0KaPQOb0GxI1lgzkl5Zh28HmwSwlLI0QP2/WEpBloxKzi8wXPFLTboCWxZUrSfrCgDZc7dSwzujVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5975

DQoNCj4gT24gOSBOb3YgMjAyMiwgYXQgMDI6NDAsIEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4gd3JvdGU6DQo+IA0KPj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggZm9yLTQuMTcgdjMgMDcvMTVdIENPRElOR19TVFlMRSh0b29scy9vY2FtbCk6IGFkZA0KPj4g
J21ha2UgZm9ybWF0JyBhbmQgcmVtb3ZlIHRhYnMNCj4+IFdoaWxlIEkgdW5kZXJzdGFuZCB0aGUg
Z29hbCBhbmQgc3VwcG9ydCwgdGhpcyBzZWVtcyB0byBiZSBhIGJpdCB0b28gbGF0ZQ0KPj4gdG8g
ZG8gaXQgaW4gWGVuIDQuMTcgKHdlIGFyZSBvbmx5IGEgY291cGxlIG9mIHdlZWtzIGF3YXkpLiBB
dCB0aGlzIHN0YWdlDQo+PiBvZiB0aGUgcmVsZWFzZSB3ZSBzaG91bGQgb25seSBkbyBidWcgZml4
Lg0KPj4gDQo+PiBUaGlzIGlzIGNsZWFybHkgb25seSBhIGNvbWVzbWV0aWMgY2hhbmdlIGFuZCB0
aGVyZSBJIHdvdWxkIGFyZ3VlIHRoaXMNCj4+IHNob3VsZCBiZSBkZWZlcnJlZCB0byA0LjE4LiBU
aGF0IHNhaWQgdGhlIGxhc3QgY2FsbCBpcyBmcm9tIHRoZSBSTS4NCj4gDQo+IEkgYWdyZWUgd2l0
aCB5b3VyIHBvaW50LiBJIHRoaW5rIG1heWJlIGRlZmVyIHRoZSBwYXRjaCB0byA0LjE4IGlzIGJl
dHRlciwNCj4gZ2l2ZW4gdGhlIGRlZXAgZnJlZXplIHN0YXRlIHdlIGFyZSBjdXJyZW50bHkgaW4u
DQoNCkkgZGlzYWdyZWUuIFRoaXMgaXMgYW4gYXV0b21hdGVkIGNoYW5nZSB0aGF0IGNhbiBiZSB2
ZXJpZmllZCB0byBub3QgYWRkIGZ1bmN0aW9uYWwgY2hhbmdlcy4gRWR2aW4gaGFzIGRlbW9uc3Ry
YXRlZCB0aGF0IHdyb25nIGluZGVudGF0aW9uIGhhcyBtaXNsZWFkIHJldmlld2VycyBpbiB0aGUg
cGFzdCBhbmQgY2F1c2VkIGJ1Z3MuIE5vYm9keSBleGNlcHQgRWR2aW4gaGFzIGNvbnRyaWJ1dGVk
IHRvIHRoZSBhZmZlY3RlZCBjb2RlIGluIHllYXJzIGFuZCB0aHVzIGl0IGlzIG5vdCBhIGJ1cmRl
biBvbiB0aGUgcHJvamVjdCBvdXRzaWRlIHRoZSBPQ2FtbCBwYXJ0LiBJIHN1Z2dlc3QgdG8gYWNj
ZXB0IHRoaXMuDQoNCuKAlCBDDQoNCg0KDQoNCg==

