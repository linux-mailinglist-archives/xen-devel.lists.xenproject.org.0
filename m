Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D3574B80
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 13:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367552.598628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwgT-00049I-N6; Thu, 14 Jul 2022 11:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367552.598628; Thu, 14 Jul 2022 11:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwgT-00044H-Gk; Thu, 14 Jul 2022 11:07:05 +0000
Received: by outflank-mailman (input) for mailman id 367552;
 Thu, 14 Jul 2022 11:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oBwgR-0003yf-T6
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 11:07:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1351bc4d-0365-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 13:07:01 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 07:06:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5970.namprd03.prod.outlook.com (2603:10b6:610:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 11:06:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 11:06:48 +0000
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
X-Inumbo-ID: 1351bc4d-0365-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657796821;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0TEMu2CA2U9x4EFs+YsQVGy8ZKemKxwsGT058D5nLX0=;
  b=G5+26mTEJgD2CFhzFURfGJ558wAUQ2/XwPneBAnALcCpH5x1rgVBfZ0Q
   /TKFGRw8lD/oEELUTAU3RvjV/QJYxWW7vnWeVK3HLD62QnEwxExTE0itx
   TQ9/kKkoug/zA8XWVoYA5IwvNHXCN49MRFDYlA4cRxSDUYZClE43LiQDB
   U=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 75601274
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6eWM1a0ypvzXaFWqpPbD5Sxwkn2cJEfYwER7XKvMYLTBsI5bpzRVy
 GEfXzyHOayDYmegeNh3a9yw9kMDuMPVx9dgTQZrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8U835pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj68xRJX4VOr1HwL4pIm9Br
 tcDLg81LR/W0opawJrjIgVtruIKCZCyea865DRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ya5KmIBwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTAlGTdqyjz2ocjmwurZMU2Drmp1MRxqw2W7EMQUEI3eVyS9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYMVtwVDvY38hqlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMtw9TlupB1sRvJQf5qCqvzhdrwcRnU3
 juD6gY3gb4eicoW/6yh+BbMhDfEjp3AUg406xiRQmu/9Ap9TJa/YJCv713S7PIGJ4GcJmRtp
 1ABksmaqewLU5eEkXXURP1XRe7wofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqaroYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:rbOEEKBrBMDp4QvlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="75601274"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqLgNdYTIpdh3StDRfaAf5kighAePxkxqyuVk+F7tdFlAO6QDn99zQ+spHJg2JCU+f1i1U9Abx1qXwpi3AXX3O+0IQqEB55mUUmkqnb+6DY+TupX/JX1JoZRZdqQX9NGcJsmydSwsb/hMXnzS/kGED/8YvzAKpoc3E6wBIzdbH24p+cZvk2OiaoiwDwoOiqfGnhy03vBYfqT11yx43oyFjh7M9QBpZAvoC5Sdj2puTJ54CAvdXEQot3yLiCO0b1eHnG6aiw4huKYYkhPPpDhJMxAu5DNkV1FgFII3Xgv2OU9xKjcrp7IIe7QG37ojPNqNqs3xSOQxSdRHuuo23KPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TEMu2CA2U9x4EFs+YsQVGy8ZKemKxwsGT058D5nLX0=;
 b=PP66atG0XLgwt/p383Wmh3rGXi9HloeRHv9284C29dXw8o/CI6xk2lePVaZPgxvPXWK/9x62sKz24wB3z1uRpKuogg6VQpYVczpiQQZ2J4kudsA+x6Hha7gByewjXeTlZP+rOtFUTrqlh9UoMmKnQtUDHZfichPc4qbOqZL0AhguvO3wvDFPInFAA3sFpl5zdukeWp57lZW0KBMXFt8b/QD2ggm6/GLZdfhJU1kt8xPdcK47PLSqZzFdDVQSiKed5znTAIIS3YUNFqAyFIC4Lqu93WWapBzE8zefmLP12vHQmPmLQlb/6c0eSJ79hvfS4zhk+62CqzCaeN2/C8nzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TEMu2CA2U9x4EFs+YsQVGy8ZKemKxwsGT058D5nLX0=;
 b=iUfKbjSKAkE1kIdD5PtF+XFIjmu+k/H/bpVlnMZ5AL8/dim2z77E+6LNOQsO3UrRWcWzA3LieM9bLGe6XOmVb6lgHfjA4oPyN7OV2vpRYOp9F/VO3GelOSrTInMeIk5GX+gs9/EEEm8hap4SLalNQeu3CUe8r3YMr8Ny+t/dpjo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-users <xen-users@lists.xenproject.org>, Roger Pau Monne
	<roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu
 Tarral <mathieu.tarral@protonmail.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Topic: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Index:
 AQHYlsiZU/X6oYzkBUqjI0g62JIGmK18caCAgAAKCoCAAPuhAIAAJpSAgAAJHQCAAAWjAIAAAbIAgAAHvIA=
Date: Thu, 14 Jul 2022 11:06:47 +0000
Message-ID: <2e761a65-f24b-edb5-6a7f-cebf47d51c68@citrix.com>
References:
 <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
 <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
 <2fad8072-e5f1-2302-f01d-82f744606d9b@suse.com>
In-Reply-To: <2fad8072-e5f1-2302-f01d-82f744606d9b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8bdc9de-edaf-4877-40e6-08da6588f23c
x-ms-traffictypediagnostic: CH0PR03MB5970:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KRwR9EYlM38osi7nX0z2tgkJQ54+/qMmm331Ayus2FIFonWiBHKhN05/sw7uIC8bunH3yjvsIRvYFAfdJzfoH+lSzPgyH0eqRQb7rgqNBLsYK22aSoSlwHPG9g8O26Ngyd4ROU5lnHG6sEUKc1TiG/dLPnXGYA52O9aM5PvGPB+SRt2IKutOTnZDQhploHtD+iIgoVbekYNe+ThQgrmaMihClTV+zE4UkDEow0lzc2Md+Hx3maXMsgHcz10UZL72d6TGa1HkVmiHbOhO9ZT/Kvc2+vaJRqmqhp3CHvWYeVrSnW2VMyWrBQncG9UIlHrHcw8YuZ1kpuhv1h8dV4vnLpVd1SHfnYt9f3gStPMhpZLM9wYSIcGjQMboG1A4zkwO1c/PmdhR9bh67nfJlu7Sgii9qkSFlKSWcFy1Tv/AiL6GCoshyv/wJ+RLWMStGVSwNZFML3fePdL3Rr81gpGqjjzNDhhZk9TyWGGdPJFqlTly2gRyV+HJ1UoxwiLqeV8rZK3fkhx6+YF3PCO1nnohmtcl4gUIqQN+LYBk+T1wsZpECz/EwwpgkN+yuqMcnC7poHZhV2KVhknUHVGaWa4W1QdmNT/V3FpWv6uAbjzGFxFspazlmmSorzYIN+b7n2z62UUWmqD2/MVhthjykLAZzj0HN5kIqhsryvPaLDfOy7HttoJYJZdcDhhNQ7p3Ilrrtmy3lg6qXAOrzqBOGDwzBq6xtDcPf0H+/nrlPFlYl3VnYMdOGFTAX1NHUKqlFZwEQj1z7DQoOA4V5Jrljhm0wMaFb3dPPVTyd6xVxH+kFZBBxGcYG9DLzffFRERkOqSVkydzXqfB3kP31OuAGT5buAop1B4jlFdr9pH0QQD8bsVv6NCAdcYEZWi/19ErEpBOEoZim5c4qr+IxxLiCjRsOfH6EfmpVKneZWHALQ3Bzyqt5uMry57LkrdsAGv434x9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(8936002)(4326008)(316002)(122000001)(26005)(86362001)(83380400001)(6512007)(8676002)(31696002)(82960400001)(64756008)(66476007)(478600001)(6506007)(53546011)(76116006)(71200400001)(66946007)(966005)(66556008)(38100700002)(6486002)(91956017)(6916009)(36756003)(38070700005)(54906003)(5660300002)(186003)(31686004)(66446008)(2616005)(2906002)(41300700001)(547064002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cExUbWxFZDdEK0ZmZkY2SUFBcSswMTVUUld2OU5hek02TGlucktyYlhLc2tl?=
 =?utf-8?B?OTZUQ1kzU0xnRmtFeDlXaE9wK1NVMnJyNFFrQjBBZ1lIb2RpekQzSDkwckJC?=
 =?utf-8?B?bmhTRUFRb1Q1OUROK1NmVXByUk54MGVQLzZ4bVV5QVlPMTRQdUlGakJFU3Mx?=
 =?utf-8?B?QlN6MktpN0ZaL1VZMzM5TkJqVUt6NmVJUmVvcmZNYlIrWExHZ3dYbjNGVURu?=
 =?utf-8?B?OGlmWmhTcFNyNStzN29lOHFjWXBydVJRc3A4Zjg2dnp4QUJtdlNvMTV0NVdY?=
 =?utf-8?B?TkxMNXdWSkltbldjUC9BV2EwOXZiMCtvS0lVTDFUblY4d3hzL3MzTDAycjhJ?=
 =?utf-8?B?V25FOE0zYjdJWk12RVVGVGwyT2E4ZWZPUTlwS1g1aUxyNCs4QTc1RmduS1Ev?=
 =?utf-8?B?VTAwRHkvS3VaNzF5OUlPcXpRL0dRb2VSSE43T2M4aEVzUGNoLzRsbk9sSEFS?=
 =?utf-8?B?LzI5QkduMDZSRHN0dVhIQWpoeHphOEczU0d2MVJTSGUrMEhJTkFQR0ZnOGEr?=
 =?utf-8?B?dzEydHFUTnp5SERJNDdsaDNybUtvRUhwS1E2dlY2ZGNTZ21pUUwzSUJ2R1Ew?=
 =?utf-8?B?alZnT25mc21DWXVZYkRYT0l0akZnVERLeG40dTY3Ums1MEJWSy9ZSWc0YkpW?=
 =?utf-8?B?MnBIK3FGUDVPNmMrcHlaRzdSQ0pSc3BZYkJkY1E2L250NjU5K2JRY0MvUzRM?=
 =?utf-8?B?K1dNa2dEQytGdlNCL2dncWFoRkd0bU9MemlRZFc4TGkwdDYzQmtrRjROekI0?=
 =?utf-8?B?TGgrcDF6dVRUQmxBWDhFVExybTlseTVXQmlhK1dSUzQvS1lwVmgwbGM5Mkl0?=
 =?utf-8?B?UTNOS2RqUWFweVQrUkY2NHdDUTgzdVloU0dTWVpuS3VsaVExL1VOcHR0N1BP?=
 =?utf-8?B?SVJSQmtHR1d6bGRhdlpOSUd6U3ljdXZ6bkJicVh3OEtiaUJ3NW1kZVJKSURq?=
 =?utf-8?B?dGlXOGFMaytrSzRPdzIwVWo3eUFUTXpJVnBVWlgwUVVmamVYQjZQeXhIdTlp?=
 =?utf-8?B?Wll4d2luVmtqVzZyUUVnV0tucXhVeStiY2lzVGNnNDdOT2pteTRwZVEwU0dT?=
 =?utf-8?B?dGRHMEFZRThEVG5kOGZjenBnUlI5RnB6UUR1Z09RTHBMUjA4c3dmeCtRZEpR?=
 =?utf-8?B?RmRWQ3AxN0tOT0VTMyswYlVZemNSeUdwK25udUovcWxkbjNWTktOdVVtcTRZ?=
 =?utf-8?B?UkFUcS9lMjNIdlFVWnBCZWZZRVNyY1V2NWlZb0Z0MXVXbVZNeWtDMnlqODNz?=
 =?utf-8?B?Q0JSSDRQUjRxQTdweEREakRpOUwwSjV4dXppYTVGYmNvbUJlbEFyU05hYzQr?=
 =?utf-8?B?cWVCeWxvRGt1ZENXTm9YVWZTQ052RkNkQVVrUDMyTzcwMXZROVRsTXQ0Uk40?=
 =?utf-8?B?RGo3ajJQR2F4aStlM2d4eFhzc1dXeVZMdFFrWVpZcHdWdDVJNXMzTlVjV1px?=
 =?utf-8?B?YzVwVjFvQm9hOE5sTVdNRjRuTnFBdjdyN3pWWUk1MFN3NklxTFViRm4yNlVN?=
 =?utf-8?B?bWlBSjl5dUtSbUQrMUdSTVlSNkNFT0dJTWljbkxMOFZESXBjSGF0UHZqVG04?=
 =?utf-8?B?NGlaNmx1UTA1eDBTcTlTdHI3eEREdzVydmQ5SWZITjVud09ocmVWMWd0T3lX?=
 =?utf-8?B?YUxvSXpnL3FZaVhvanVwd0dGS2dvaklTclg0WUdoVnliK2ZJRGhJZm16dGhu?=
 =?utf-8?B?T1l2QlVVa0xPSzB1UkJzc212TEhteXRWNVN4V28wSjNPanVpNnQ2OWVkcGZr?=
 =?utf-8?B?Y3lNOTZFdlppcWMwbVRaaXNnalBta0R0RVoxZW01Y1VWaEtBN1hiclV2SnFv?=
 =?utf-8?B?c05seVMvMGFNT3lsWWZXczRlZE5NWFRYOWZuZk90ZXMwM0dBQTYrU2xza2x3?=
 =?utf-8?B?eXlXbnkxUDRVOHB5NW9WU2JHY2poV0pnbWZ5eFB3UWdrNk5JOWZQckNuQ1Zj?=
 =?utf-8?B?S1c5cHM2cTVqNFYyVXVocm5mQ29jelcrTXZqN2RXL1hmWHFZWTJnUVJwelR3?=
 =?utf-8?B?NFBFLzZVSTJTQitvLzdsaVZPa3Yvb1R0ZkFqNE91ZW8zRW1tcVhHVUJXMFI0?=
 =?utf-8?B?d2FmK1p1ZGJObnIvOW9wYlpQWHJTSU85Wk13MHRSNGFMUStldFpwWGMzaWsw?=
 =?utf-8?Q?RIy7w5NgZTSJcyKgwiQyHFOsv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB65E9053F5FED48B4B716515FFB2FD4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bdc9de-edaf-4877-40e6-08da6588f23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 11:06:47.9870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AT+GjXAjnCUcZV6iUIwel+1pAcLuguqMX9ZaizmGEhumB42mcPKaVkyYDRS3el6zqyXln189/z2ejeh0perAwp+oWnoZCwlqcpn32rMUmKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5970

T24gMTQvMDcvMjAyMiAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjA3LjIwMjIg
MTI6MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wNy8yMDIyIDExOjEyLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4+ICsgQ0MgeDg2IG1haW50YWluZXJzDQo+Pj4NCj4+Pj4gT24g
MTQgSnVsIDIwMjIsIGF0IDEwOjQwLCBNYXRoaWV1IFRhcnJhbCA8bWF0aGlldS50YXJyYWxAcHJv
dG9ubWFpbC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBMdWNhLA0KPj4+Pg0KPj4+Pj4gSGkg
TWF0aGlldSwNCj4+Pj4+DQo+Pj4+PiBZb3UgYXJlIG1pc3Npbmcgd2dldCBpbiB5b3VyIHBhY2th
Z2VzLg0KPj4+PiBJbmRlZWQsIGluc3RhbGxpbmcgd2dldCBzb2x2ZWQgdGhlIGlzc3VlIGFuZCBJ
IHdhcyBhYmxlIHRvIGdlbmVyYXRlDQo+Pj4+IGEgZGViaWFuIHBhY2thZ2UuDQo+Pj4+DQo+Pj4+
IFN0aWxsLCB3ZSBoYXZlIGEgYnVpbGQgc3lzdGVtIHRoYXQgc2lsZW50bHkgZGVwZW5kcyBvbiBn
YXdrIGFuZCB3Z2V0LCBhbmQgdGhlcmUgaXMgbm8gY2hlY2sgaW4gdGhlIGNvbmZpZ3VyZSBzY3Jp
cHQgdG8gZW5zdXJlIHRoZXNlIHRvb2xzIGFyZSBpbnN0YWxsZWQuDQo+Pj4+DQo+Pj4+IEFuZCB0
aGUgZXJyb3JzIGluIHRoZSBidWlsZCBzeXN0ZW0gYXJlIHF1aXRlIG9ic2N1cmUsIGl0J3MgaGFy
ZCB0byB1bmRlcnN0YW5kIHRoYXQgeW91IHdlcmUgbWlzc2luZyBnYXdrIG9yIHdnZXQgaW4gdGhl
IGZpcnN0IHBsYWNlLg0KPj4+Pg0KPj4+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzID8N
Cj4+PiBIaSBNYXRoaWV1LA0KPj4+DQo+Pj4gSeKAmXZlIENDIHRoZSB4ODYgbWFpbnRhaW5lciwg
cHJvYmFibHkgdGhleSBrbm93IGJldHRlciB0aGUgcmVhc29ucy4NCj4+IFRoZXNlIGFyZSB0d28g
ZGlmZmVyZW50IHByb2JsZW1zLg0KPj4NCj4+IFRoZSBjb25maWd1cmUgc2NyaXB0IGRvZXMgY2hl
Y2sgZm9yIFdHRVQgKG9yIG1vcmUgZ2VuZXJhbGx5IEZFVENIRVIpIGFuZA0KPj4gd2lsbCBvYmpl
Y3QgaWYgc29tZXRoaW5nIGlzIG5vdCBwcmVzZW50LsKgIFRoaXMgaXMgb25seSByZWxldmFudCBm
b3INCj4+IHRvb2xzLyB3aGljaCB5b3Ugc2hvdWxkIGhhdmUgYmVlbiBmb3JjZWQgdG8gcnVuIGNv
bmZpZ3VyZSBmb3IgYW55d2F5LCBzbw0KPj4gSSdtIHJlYWxseSBub3Qgc3VyZSB3aGF0IHdlbnQg
b24gdGhlcmUuDQo+Pg0KPj4gRm9yIHZhbGlkLWFkZHJzIHZzIGFsbC1hZGRycywgdGhhdCdzIGNv
bWUgdXAgb24geGVuLWRldmVsIGJlZm9yZS7CoCBJDQo+PiB0aGluayB0aGUgZ2VuZXJhbCBjb25z
ZW5zdXMgaXMgdGhhdCB3ZSBkb24ndCB3YW50IHRvIHNpbGVudGx5IGRlcGVuZCBvbg0KPj4gZ2F3
ay4NCj4+DQo+PiAoV2UncmUgdHJ5aW5nIHNvbWUgbmV3IHByb2plY3QgbWFuYWdlbWVudCB0b29s
cy4pIENhbiB5b3UgdHJ5IG9wZW5pbmcgYQ0KPj4gYnVnIGhlcmU6IGh0dHBzOi8vZ2l0bGFiLmNv
bS94ZW4tcHJvamVjdC94ZW4vLS9pc3N1ZXMgYWJvdXQgdGhlDQo+PiBjaGVjay1lbmRici5zaCBp
c3N1ZT8NCj4+DQo+PiBUaGlzIG91Z2h0IHRvIGJlIGEgNC4xNyByZWxlYXNlIGJsb2NrZXIgc2Vl
aW5nIGFzIGl0cyBhIHJlZ3Jlc3Npb24gZnJvbQ0KPj4gNC4xNi7CoCAoQ0MnaW5nIEhlbnJ5IGFz
IHJlbGVhc2UgbWFuYWdlci4pDQo+IEV4Y2VwdCB0aGF0IDQuMTYgYW5kIG9sZGVyIHRoZW4gYWxy
ZWFkeSBoYXZlIHJlZ3Jlc3NlZCBhcyB3ZWxsLCBkdWUgdG8NCj4gdGhlIGJhY2twb3J0cyB0aGV5
J3ZlIHJlY2VpdmVkLg0KDQpMdWNraWx5IG5vdC4NCg0KUmVtZW1iZXIgdGhhdCB3ZSBkZWNpZGVk
IHRvIG9ubHkgYmFja3BvcnQgdGhlIGxlc3MgaW52YXNpdmUgcGFydHMgb2YNCkNFVC1JQlQgZm9y
IHRoZSBzZWN1cml0eSBmaXgsIHdoaWNoIGlzICJlbmRicjY0IG9uIGFsbCBmdW5jdGlvbnMiLg0K
DQpXaGVuIGV2ZXJ5IGZ1bmN0aW9uIGlzIG9wZW4gdG8gKGFiKXVzZSwgdGhlcmUncyBubyBwb2lu
dCBzZWFyY2hpbmcgZm9yDQptaXNhbGlnbmVkIG9uZXMgdG9vLg0KDQp+QW5kcmV3DQo=

