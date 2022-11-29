Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DE63C4FE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 17:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449541.706360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p03Ms-0002c7-OC; Tue, 29 Nov 2022 16:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449541.706360; Tue, 29 Nov 2022 16:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p03Ms-0002Z5-L7; Tue, 29 Nov 2022 16:21:58 +0000
Received: by outflank-mailman (input) for mailman id 449541;
 Tue, 29 Nov 2022 16:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p03Mq-0002Yz-P3
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 16:21:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc4751e-7001-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 17:21:55 +0100 (CET)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 11:21:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6473.namprd03.prod.outlook.com (2603:10b6:303:120::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 16:21:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 16:21:50 +0000
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
X-Inumbo-ID: efc4751e-7001-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669738915;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MXW05O58NixGhXdhHN3mZrIM0EL887lxF/qHl1K1M4k=;
  b=Lisn2eW4KEieo6vTh3djCzsNIzgtdR+Pf8n95J2dgSNUFaFMa+8OUdwi
   9SQN9wfc0rcORb29egzt608EZGSnngpgQV+uhMGeg3rqfB/omDx5Dd3O+
   /SdVqafOuhlxue+VahGyF2eR8+blLDr6OjJyK8jeI/NV/qCP6v180FP0Z
   s=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 84824054
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HeUm660EchBNsGrBePbD5fBwkn2cJEfYwER7XKvMYLTBsI5bpzFTm
 jNNUD+FafiNZWD1KtlxPIWw9UoA7ZaAzoQyHlY6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMU1n7
 u4kLAk2YS/errvuxuOLY9FKv5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Pl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+rAt5KSeHQGvhCr3adx0g2KT4tcEqXm8WzshKfZNlwJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdlvigqVFoo4VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:JWVQfKFrUlkcLDJUpLqFwJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7yfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA+7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1cwKoVKuZEIMvJ0vFhLA
 BcNrCb2B+QSyLCU5nthBgq/DVrZAVqIv7JeDlYhiXf6UkqoJkw9Tpl+CVYpAZByHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94qIfzY9Fk91CQqZ4uqcaid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbehGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7YrHCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8WzssrPWCznCFL5LYdvnFrIoufkw36V3w3gooEX84N2XIjtftaFzdF
 diIdrc49GGmVU=
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="84824054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwIMMPexHxXhVm+wkIKUJhx/f3kCnABi87kQOa3byXLHse1l6BHrHJuPWKNrmtFH+u7JgEaW+x21Z1lzupQpl4kqHYjHmQ29R7paN39XLnPD8aBfOQPZzj5fcoAneYIMpdU+otB8/iy7AnkxBWwmhK16H5pAyOa09KudSDZ1byVAYiibY4V2XXjeNL5uo2unMdW5QRI+XH+e9r9q2rSV+aCNKLXvorZWWPKZkSyAJ4HJeKZjROW5rBigSIENz1m3BzVnR9P75V6MLqPQNQCyRQ0iCJAzOn0OQENB5gPRgXUGRfc5rk5W3yUQIWgCVzJyjxleg3skrcVaSzTd7OHYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXW05O58NixGhXdhHN3mZrIM0EL887lxF/qHl1K1M4k=;
 b=irmwicbAe5m67efdnDDm+Nva6xQV2o4taSQFrLGAaZnZcznUcGlONxj9xeec05vZggVS6eYlH/TJa38M7kY+qfa30oKWvQK4wnBVjmSfDkvctshFjHz7CmkwTJdLEguDGzSo36BycY7vTzUhBT+MtrrwMEfWeXphmPKccAjx8ym67G7gfLJByWsOn1+56UDJ289Etx7I14UDsBRFjKmxkzkAHaHFo5yI0LR4EKC3WcKQ35S9U1jaE6/hqO7a+gdyFJS5DmmMr8f+35F1WuQ2/WPDEGDzf8ghsJ4wsnOL4aBP4xfVITwpp9Sk5ioBAT0PjP3WyWu2IBo1Ba461LXGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXW05O58NixGhXdhHN3mZrIM0EL887lxF/qHl1K1M4k=;
 b=u/9lKRVsJ73jE7hbUYXNXnitldAKBu77oxyiDXZzUfzDR8azm6Is+kLa2dUsqJk7YnOI5Hey5MlZVRy/4+/wEA+5mxUU+faasqeFMLvXsKQvxH/BxtjnBbE3x63nJ+QP1Wq+ggaUBHFCRVzHn3CLD2aa4qLdDk2LppeQTnBaocs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/APIC: make a few interrupt handler functions static
Thread-Topic: [PATCH] x86/APIC: make a few interrupt handler functions static
Thread-Index: AQHZBAFkcdSZ5ocJ5UOIQIf8MA/Xq65WEOmAgAAEcgA=
Date: Tue, 29 Nov 2022 16:21:50 +0000
Message-ID: <b4e8cfc9-7a1d-dac4-4258-ddb7d2c06075@citrix.com>
References: <54ee1bd7-9b6a-efc7-8bad-50aa7d6d955b@suse.com>
 <Y4Yt400C4cHxMAal@Air-de-Roger>
In-Reply-To: <Y4Yt400C4cHxMAal@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6473:EE_
x-ms-office365-filtering-correlation-id: 68fb6492-7d87-4634-1992-08dad225d215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p91ZmfsxWSqHltPWeqrg+JgsPMEyKF0Nt3hX4inAexwUISfKCRhv5uDT7xjiOrQT4LHVbTTNRpHfZB5V5GIRQm60/XRoj98hAE0SDxSlCPbQTWjhH4MlkpwVXw0qmL6O7Hv8stKmbWkQynow7qK7pk+NttFToUAj4+fHAN+cTUfTnlq59UKkOf0vUoeV0e+JjsdPiZRIol+j4ogn+kOrilZcK6Gcob8EQSXzMSM9kkar6dWchtxAvPGyVFaQZc6d0batd8KzCiWLt/afO078OV02UkHsk/pJDMf8Ozji4JETQsyGqtLaEbgpHXupZ9NlZrEh003CHyuMpg8AEYTaQ1NQFsKReMH5SgzfwDX0sIdixv4AtkAXL/tOkBeG/3Ap29bmSxwdvErVuS7oq9QnUXdlG6y+wXed9aRSogcCrb+iY1WK7aV1LpbDTGlmI0OBoKxDihVceIh+fgbVsK2H9xkGoFQFbxtETcVMetWa1BEqB3DjATBcW/kM1PyRWeV9drvG67OwDXNGqtN8tvbG7bJzW96JY9rdPaWnQRDJq1KTteG4/nT5k9K8ycZIa8R7rNXsXHGRmixo57UuWwkpf68f4lKqeBWuJezbLkbSX1SItsQ5qXOfnlNXY+JdmTCMevgVjRInJ2jfM2EnhVZPnTSqmRgFQio441yoq2po0VAilvWes775b27lPn/PEIW4oRbuxO1HhG3MzHTUS5QSZHbtVqtvWRdLeMCjvdYXoS5hZaNeC6qrCA+TkK1NVsyXSMhVjpyd9aNOlh5z1mI4ug==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(82960400001)(31686004)(36756003)(110136005)(2906002)(38100700002)(8936002)(122000001)(38070700005)(86362001)(31696002)(6486002)(8676002)(76116006)(6512007)(64756008)(66556008)(4326008)(91956017)(71200400001)(186003)(316002)(66946007)(54906003)(478600001)(66446008)(41300700001)(5660300002)(66476007)(2616005)(26005)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnJDWWNhaUw0V2ZNd1M4V3NwT3JmNmxBMWd4U1JFbWtSUldTOXRXUEp5UDVw?=
 =?utf-8?B?b3RJbFZGWk4zSW9uL0I4QitiY1p2SFY2ek5rSWdCeFlNUE0xbzRBQ2RRdDZ2?=
 =?utf-8?B?dEoxMFNRZzg2ZEtkVTNDdXBDaVVmWXNPUlpHMHJ0WGdMWEhVckRIT0JoSUdE?=
 =?utf-8?B?N0pYNEw0Z0UrSERGRjN3VHNleDR3akR3OXJ2QUx5WXJHVDJSRlgyeEVVNEs2?=
 =?utf-8?B?b000VC9rRVNmUXdtQ2VMTnI1am05TS9SWXhMN2E0V1NwR3hublZsNFBkWE9m?=
 =?utf-8?B?YS9GeWF5QWRWTzJjQXRzVUt1OStBVnRuajJrSlIyUHdUTUNsdlF4K1k4K2FY?=
 =?utf-8?B?cHVqUUErenAxblhBWituZ2taZ3NEemZvajAyRGpYalpmL25rc2VHVEdUN1B6?=
 =?utf-8?B?MUNld2xoWVlIY3daV0l2ejdNRW5jN1B5UFg0aWpSZGtqUHZiM0hsMDFLUjgw?=
 =?utf-8?B?LzJuc1pvaGRQcW04eGttbkNZT0hLRlEwa1Y2WGZYQXNTbDFEM0FVc1YzMlRO?=
 =?utf-8?B?ZDFlNGVzS2J4bDQ2dkhMcHFqMHJUT0VLamhtTVVXU3pEWENFdXhOSkczMlAz?=
 =?utf-8?B?TkIvNFhLZTFxdHRnSzR3UlVUaW9zTEx0OWl2bDd5UVc4bU5FMlZxUlRrL29n?=
 =?utf-8?B?Z3lObXU1YjgxUjBkSkcwNmI3aWpUbi9xVjlOQnV0dVdOZWxRalBBUVBOakpx?=
 =?utf-8?B?REI3Q2paSWs4SzdBU3l6WTVqZTVEdTlNQmJidmZlc3gwUExRT2czL3dPWStt?=
 =?utf-8?B?RHpONzk1a2FZVVlNOUlNN25ZaGlVR1UvbktONTJ6STVUOGV4eXJIU1dWOGI0?=
 =?utf-8?B?eVl6WktSNmZEMzdlK1pMZUlUekduaXpMc2tHR2FkcUM5NDkyRjFXNVBsNk5k?=
 =?utf-8?B?eHF0K05sZzQ2L1pGeDdPeXF1WG9TakR6RVQ2VlBtdlZnekszYmFxT0c4SXRl?=
 =?utf-8?B?MFBPZ3R2c2hUNFpMSFFYU01ZWWFTVnhpY1crRzREUUZIN1BFQ3daWEMwZWs0?=
 =?utf-8?B?SEJXaFJ4enFVbTM4aWtUam5jYWUxSzY5YjhqdmdiSnRZMDZncTc4YWVBU2Qv?=
 =?utf-8?B?VTFvVUxEanc3Q0RHV00rbitNd25IN0tZMXBWYm1IQnNUSHV3cWh3WGNnV2Vz?=
 =?utf-8?B?RENXSEJlN1BKZE94a0NSbGRDM0o4K2J2VEMxOUpEU2VJS2RVNEV6ZUpJalNI?=
 =?utf-8?B?K2dSZTMxaDZvdEIyTk5nVnV0cjUvaWV6VnU5RDA3UlJxT09IR1ZzcnRrbjZ5?=
 =?utf-8?B?blNkeFRkbkZmVk45Z21VUGNRK1ltcjNGcVFsUCtaOCs4Z1ViMEdaak9DR1JQ?=
 =?utf-8?B?dkFqMk9SUm9IbmYyUmd0RGw3SXZLeUFBRnE0VVhscjBFUDdiVXFQMjRXQkRu?=
 =?utf-8?B?SkNMdWRlUjNJeDZKMVhjcEN5aGF5TFc0ZUtRTkEvcmtERytaVFBpbUpzNDEv?=
 =?utf-8?B?N1k0WXFxbDBDTW9jT1d0dTI0aUNkSVhXN28xdUtrL2M2cGRaemk2aEJ3ODVK?=
 =?utf-8?B?dFFZTVVoV2ZlempJN2VpeW5FN3pRMzI4U3dmYUs5R29qNzRDSVRhdHZBV3hO?=
 =?utf-8?B?UzdzenpGQjRRaDBxU0hOYisrKzBicFovMnE2bldsZ0VhOGw1MUI3NmVINE9K?=
 =?utf-8?B?ejlyRmF0RU9iaEVyb3A3ZVQvc05FUU5jZ2c2VW1FMjBmY1lvNHVOY1B6K3RV?=
 =?utf-8?B?a0YvNnRJTFNtV0l1azN5cmRPc1RlNGZwdjdxeHk1STQ0TC9uMG51dUN6dDFv?=
 =?utf-8?B?VTlRZWRnSVMrNWlxRGpaZ2ZMRzF3Z2s2QkRKQW5HNlFNZC9wRTE5cnExMmRT?=
 =?utf-8?B?cEw2ZWZwOVhmenJxb0k0L25Md2wvOTcxTXRRMklvRnE3TmxOTVVIVm8vUm1v?=
 =?utf-8?B?RXRzNzhOM2RFaWtFV3NtQ01tU2VCSjlGc3dTb005ZzN6V2hsWlc3Z2ZPdVU2?=
 =?utf-8?B?bTZDU1NYTERYVGduSXdQVUF1NGtRdCtyMmEvVmNJM0k3eFpwZkdYTE5JbS93?=
 =?utf-8?B?cFlZMVE2aUwzWVFOS1dkelRxc01uc000eVdiNlVJWU9sQjN3YTFFUTEyUmNQ?=
 =?utf-8?B?dThsTTFGTDVVL25JSzFDeTBOOUhXL0hVYkRub0tjZlZvVUlqSm1lMk42Vmdo?=
 =?utf-8?Q?qABBA3QrLArnrWjclAKLYrGHP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9853507EC433F04BA2FC149951238052@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fi/2LeFcw4FuUwxh+JeA7I3lEx5unreuSlMGcilEkpijXaVMUCsB7ZlApzDaMBpP6aAvMWoRWQ9/Eh9me7qVbHtk9F8jK8nkldz2bA18Dx7KyBlQHpuQLGDEuH9DPrZq6e0osGlzognpISyBaif0POmM3/a6nDp8jEhvCkaNL93+x/N/FkYsYFyTT9+Frw4fdJl3RXYopPRFc9Eusbke8bDfFeIF9CcO8EKGb8gO55SZD7Bnbe3v6BprBHPSOMbZ0hSBkkFSq9f+SWQq/xIRQePh8ZCDLGgsbZrtn5u6vbRlAFQ2AouO1aGrh5oKQ12FidNf3aD1m12TWyMCB4/ue8dmp90ss9Tcajs8uYcxOIKlX9zS/fcW02Wr36YHvIS7pPReZW/E5ZtxQKg93NYVT5KiRZSQ0LGKAqtzGbRgdWZj66A4hEXBcxmzDHs83jINPGheiXPqDMaCz2KaiN6IZM33O/BzBBTRBHnks86lYwN8f7UhQZTJAZUejTAb2683dbJq9bIqjKWepQytjEYNIIAQfLcxRjs+BwD/6vDoPlYvGW6jj4r7oF7637Odyzll5e1TMp+NxyD4uZooqR7FxxiSrmmQH/YdPaieuVaBZYO4j55AO5ACjvWTka2Z08qs94F0VpIWpz6uP41D0G9magLjezaKn+z6w6txPRNfhNuqnr7ZSjUPs0k0RbAjxc5vunThuLQhUOQa6FhndAMEh2v+sYy6nzCP32ku0trBjqFpmDNrOCe6aOQ+CexN2aBmc5CFb4a+To31YJzRwI83KCe40ZFD+eqY62Fl8NOT7aHf6sA2eD16e806gN+mI7Jktwyzy22Y8EzlPIG9XBaq/Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fb6492-7d87-4634-1992-08dad225d215
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 16:21:50.5942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +vOU+OA6EZ0kWPNj2ReiPhsBY+MXAbFuliX1wg2vfdkPJ5DYROAx7sWYrRlh8y+vW8VrBqbAmMySP6V0aPH+8pvzsj/lsSZzyDZyOtyB50A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6473

T24gMjkvMTEvMjAyMiAxNjowNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBO
b3YgMjksIDIwMjIgYXQgMDM6NDY6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBG
b3VyIG9mIHRoZW0gYXJlIHVzZWQgaW4gYXBpYy5jIG9ubHkgYW5kIGhlbmNlIGJldHRlciB3b3Vs
ZG4ndCBiZQ0KPj4gZXhwb3NlZCB0byBvdGhlciBDVXMuIFRvIGF2b2lkIHRoZSBuZWVkIGZvciBm
b3J3YXJkIGRlY2xhcmF0aW9ucywgbW92ZQ0KPj4gYXBpY19pbnRyX2luaXQoKSBwYXN0IHRoZSBm
b3VyIGhhbmRsZXJzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPg0KPiBBIG5pdCBiZWxvdy4NCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hcGlj
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMNCj4+IEBAIC0xMjcsMjEgKzEyNyw2IEBA
IHZvaWQgYWNrX2JhZF9pcnEodW5zaWduZWQgaW50IGlycSkNCj4+ICAgICAgICAgIGFja19BUElD
X2lycSgpOw0KPj4gIH0NCj4+ICANCj4+IC12b2lkIF9faW5pdCBhcGljX2ludHJfaW5pdCh2b2lk
KQ0KPj4gLXsNCj4+IC0gICAgc21wX2ludHJfaW5pdCgpOw0KPj4gLQ0KPj4gLSAgICAvKiBzZWxm
IGdlbmVyYXRlZCBJUEkgZm9yIGxvY2FsIEFQSUMgdGltZXIgKi8NCj4+IC0gICAgc2V0X2RpcmVj
dF9hcGljX3ZlY3RvcihMT0NBTF9USU1FUl9WRUNUT1IsIGFwaWNfdGltZXJfaW50ZXJydXB0KTsN
Cj4+IC0NCj4+IC0gICAgLyogSVBJIHZlY3RvcnMgZm9yIEFQSUMgc3B1cmlvdXMgYW5kIGVycm9y
IGludGVycnVwdHMgKi8NCj4+IC0gICAgc2V0X2RpcmVjdF9hcGljX3ZlY3RvcihTUFVSSU9VU19B
UElDX1ZFQ1RPUiwgc3B1cmlvdXNfaW50ZXJydXB0KTsNCj4+IC0gICAgc2V0X2RpcmVjdF9hcGlj
X3ZlY3RvcihFUlJPUl9BUElDX1ZFQ1RPUiwgZXJyb3JfaW50ZXJydXB0KTsNCj4+IC0NCj4+IC0g
ICAgLyogUGVyZm9ybWFuY2UgQ291bnRlcnMgSW50ZXJydXB0ICovDQo+PiAtICAgIHNldF9kaXJl
Y3RfYXBpY192ZWN0b3IoUE1VX0FQSUNfVkVDVE9SLCBwbXVfYXBpY19pbnRlcnJ1cHQpOw0KPj4g
LX0NCj4+IC0NCj4+ICAvKiBVc2luZyBBUElDIHRvIGdlbmVyYXRlIHNtcF9sb2NhbF90aW1lcl9p
bnRlcnJ1cHQ/ICovDQo+PiAgc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSB1c2luZ19hcGljX3Rp
bWVyOw0KPj4gIA0KPj4gQEAgLTEzNjMsNyArMTM0OCw3IEBAIGludCByZXByb2dyYW1fdGltZXIo
c190aW1lX3QgdGltZW91dCkNCj4+ICAgICAgcmV0dXJuIGFwaWNfdG1pY3QgfHwgIXRpbWVvdXQ7
DQo+PiAgfQ0KPj4gIA0KPj4gLXZvaWQgY2ZfY2hlY2sgYXBpY190aW1lcl9pbnRlcnJ1cHQoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiArc3RhdGljIHZvaWQgY2ZfY2hlY2sgYXBpY190
aW1lcl9pbnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+IEdpdmVuIHRoYXQg
dGhlIGZ1bmN0aW9uIGlzIG5vdyBub3QgZXhwb3J0ZWQgb3V0IG9mIGFwaWMuYywgd291bGRuJ3Qg
aXQNCj4gYmUgYmV0dGVyIHRvIGRyb3AgdGhlIGFwaWNfIHByZWZpeD8NCg0KVGhpcyBpcyB0aGUg
aGFuZGxlciBmb3IgdGhlIGFwaWMgdGltZXIsIGFzIG9wcG9zZWQgdG8gdGhlIHBsZXRob3JhIG9m
DQpvdGhlciB0aW1lciBpbnRlcnJ1cHRzIHdlIGhhdmUgZWxzZXdoZXJlLg0KDQpTaW1wbHkgInRp
bWVyIGludGVycnVwdCIgaXMgdG9vIGdlbmVyaWMgYSBuYW1lLg0KDQo+IFRoZSBzYW1lIHdvdWxk
IGxpa2VseSBhcHBseSB0byBwbXVfYXBpY19pbnRlcnJ1cHQoKSB0aGVuLg0KDQpUaGlzIG9uZSBj
b3VsZCBsb3NlIHRoZSBpbmZpeC7CoCBBbGwgUE1VIGludGVycnVwdHMgYXJlIGZyb20gYW4gTFZU
DQp2ZWN0b3IuwqAgSXQgbWF5IGhhdmUgbWFkZSBhIGRpZmZlcmVudCBiYWNrIGluIHRoZSBkYXlz
IG9mIG5vbi1pbnRlZ3JhdGVkDQpBUElDcywgYnV0IHRob3NlIGRheXMgYXJlIGxvbmcgZ29uZS4N
Cg0KfkFuZHJldw0K

