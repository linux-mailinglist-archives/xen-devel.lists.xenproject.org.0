Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D1662C01
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 18:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473891.734731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEvWz-00057c-A7; Mon, 09 Jan 2023 17:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473891.734731; Mon, 09 Jan 2023 17:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEvWz-00054v-7J; Mon, 09 Jan 2023 17:01:53 +0000
Received: by outflank-mailman (input) for mailman id 473891;
 Mon, 09 Jan 2023 17:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEvWx-00054p-Kz
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 17:01:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4df174a1-903f-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 18:01:49 +0100 (CET)
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jan 2023 12:01:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB5998.namprd03.prod.outlook.com (2603:10b6:5:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 17:01:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:01:43 +0000
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
X-Inumbo-ID: 4df174a1-903f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673283709;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R/0Vk+33U8Ao4aCiSMmv1v9fvlZ/B4rPwFCHz8IDlcc=;
  b=D5UqDEcpmjSFquNmPXwLzjvjjp9TYPxyUqsYfzMaFSU5EpbRz+/cXQDL
   JSMQhSdvI8w61rfCFVoWYIa3gHz2TxdaZgu2kZmFodXrnqcCM9fJabB1e
   ng8kM5jeaDPX+ZEmvfqm1ikoC0u6MKB5x9YZLPuljaCoBxdlSMzkmhfjz
   c=;
X-IronPort-RemoteIP: 104.47.74.49
X-IronPort-MID: 91829678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dETh6aA9i9GOJxVW/wriw5YqxClBgxIJ4kV8jS/XYbTApDwr1WZVy
 GAdDD/XMviONGqkf99zbIi1/UlXsJKGn95nQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6p4GpA7wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvaVwKFtCt
 sEieCkkVzfboce9g56VY7w57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17afx3KlB9J6+LuQ6/51g2SOyE8pVDoXX1+ap7rnjBW/YocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS9wWl2qfSpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgAQJG4GICUCHQ0M5oG/pJlp1k6eCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:jUbozq0uZVY5aAggPg71egqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91829678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt0DUxG460tfBmNnHh1Q6av9KIRW69CcraKUjYeOM7VIZuKn7HJfJjziwcAWVGSA/qpMdm7eUt0wGa5IcK4tTXiv5oXnaRKBrAkf2Y88tYbFdbfPzOW3uSsj42i4Cm7ImRSCAfmnwlxLYPRb4+IK9d4R8SG9qfw7omZMvtUVzqd/cXVR0t0Eu55yZHiQ1N148yRQAS1NGBhJvQMCykjHd7hM2RywRvtWZcFzVDv7bqwPH7bmxVUBfvHuiZJxpErTCpQWJExXnNnrbyr7dSV7nuSaPY/BuTznfHZeFVmQwo+uP/nrHyXiGNDLTzciATROABpele9+WuD8gabMMDGIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/0Vk+33U8Ao4aCiSMmv1v9fvlZ/B4rPwFCHz8IDlcc=;
 b=FNrcjecLDJY5FPR7crHgMFhUY/h16LecuxnqIxHVBjhZ9alkaBKAp+2GL+1R1CjUSM1gFPGau9WBHLybWyl+yCD8lZFrjHLjFWiZu19egpSqMju9NZhdjW83IxN+C2GJP+6iRhRL7/wLqxZPSfYHgx885lLOzXAfNjPKvFacbYVTqolbe/JBgVmhlraa3F5nrvxqOQIXc/vjW9STOZAw0ESqlYjH/Xn/HZ74m1IpUHls19xM2hTra1jrj/u6g1hoA7uaTJf7oyO3Ma2jUGQu1ocDcMgqat9j4p4+rcxllewea6KJd6bWY4qE2zB6CRzvvHWVsLe3j3904YljbwrS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/0Vk+33U8Ao4aCiSMmv1v9fvlZ/B4rPwFCHz8IDlcc=;
 b=FCzUQXcz1pdhVeHJHKACc5MVzOTQCGQCg0iTgkuZ1M5H/XaSYp2X4eFgCUpYqia+NnM49xvjxtV4jV9j7OswMitNzv8QXA+GrHeJaG0subXCB4MIGvoYYvxBbjOOhwVCY/+qBDNCrdjcHsaD/xWv3rC07PvsUoAFP/OVAYRwsm8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 6/6] x86/hvm: Support PKS
Thread-Topic: [PATCH 6/6] x86/hvm: Support PKS
Thread-Index: AQHX8mMBaDBKE3ERDkqjj25vs7mo16w85QUAglvOTAA=
Date: Mon, 9 Jan 2023 17:01:43 +0000
Message-ID: <f0095240-4122-df0b-9bd0-5e9d53181ebc@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-7-andrew.cooper3@citrix.com>
 <e8d01f45-fc80-0908-99c5-454991a9209e@suse.com>
In-Reply-To: <e8d01f45-fc80-0908-99c5-454991a9209e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB5998:EE_
x-ms-office365-filtering-correlation-id: 00fee7e4-3012-43ba-3a62-08daf2632f1c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7zPoP3nXOPgEaqlN1CKTHSvOSAzReyv6I6AIgfjX9v0WfLUiFKfq+Z0/SQXmfuN4FDmskp836XswE8u8v0aUNsK8+N7Ejhgx9tD2QwAOH/rdVlYiKlNb64TnmphQWLdJOXp0Nha3hurRePLtAbnkjNg/NsFjvhtOFoEgZwdvXCQ4LEwQYSIcMBd5CkHNv4gDxwIvtexz1Z45m5928CIz8R8zVOSEXpKih8+2QnqHlkUOKYWeUSR4ib3N0L49g0x0FOwvqg51UVIyHQmmx7jY0gcTv2S0Ts26hcUkHEI/j30aBIG/EmYdSyP212abfu95BtyvL1dsab/9cU1gxOKu2b1guacmEQd6Y8RnA1fuubZL8UqRtT+46WKzpPSEcpa2UKh633JObBmWyfCcZQufOAbjF8jL5Z2c2J1gpNQ3PIy2xbNRQWMOTm2QfmbWIllbrzNUp+a5znAzFGjssuLJ24LZKsHponBF8N+O3LJbVavPYY+cldcUPrh2i4pCpMb4O3NWAe8VeMrSg4yoQFOtquiKiIk4hBMtTHeUB/L/Y/4gZOXl6j8hxN1CmlgHKTVC600dNfNnh9wY0THbfzm3ORC6gpt9tWdIoNnhAJII/cyT0NHqGWLWLquM/IqQFGqatiQmVDsi12S+FMYUwO4QDwGITuoCiWICs2WLw0k5k9ZOESNxfWyWBsn9nYryf5oQNcSm2krEQfOP8oIsQ78F7y5EHFKbo1KE+v+WZqke0SU3W6fNjZGEEbacWNQRApIV/i5Nyf0i7Bhyp+xc6/y4tA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(82960400001)(122000001)(31686004)(53546011)(2906002)(478600001)(6486002)(2616005)(26005)(6512007)(186003)(5660300002)(316002)(71200400001)(8936002)(38070700005)(36756003)(86362001)(41300700001)(31696002)(8676002)(54906003)(76116006)(91956017)(66476007)(66556008)(66946007)(66446008)(6916009)(64756008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTJiR2hMd1B2dFdRdDRDRmJQUXFWbU5DT0syUlJvWGJQb1F1TmVQOGZSQ3RZ?=
 =?utf-8?B?R3pnSjNvdG9CS1JqRTdyaWp6LzNWSjFNMHJoR2JQRXN5RGpqU28xVG5jVXNZ?=
 =?utf-8?B?c0JNZWY5VjVPQ1hLV2dHQWI1d3oxaWpkQXM2akFaUWxscmNheXhITXI1N21z?=
 =?utf-8?B?ejNvdnMzNUtZamkrQlZaRXBLcmxTdEE0RkpINGFCajhsUXFGWnNSNUNvN2Z5?=
 =?utf-8?B?T3ZoVEJucERCeFlmZEQzbjBobzV3WWdocGZPQnYxL0xrRERtTmdxMGpzeS8w?=
 =?utf-8?B?a3FJb2RIQWxqbjBJbER1Q1NCWXpXb2Uwdk9aUGpkc0N0UzRKbVdaQU5sZjNO?=
 =?utf-8?B?WlpkTTlMRVJSNTBLcVhSTjlvZTI2eU0rVEtENUtoRWxPTmZsVG1kZWwyR2kw?=
 =?utf-8?B?aG54Q0pUN1hveHVGWlpIZGJ2VTFmdWx5Mk93NGN2MDYxSkJNeGhXV3ozUVNF?=
 =?utf-8?B?RG9zQVhhUlhydWh3cjYvcEpoSWhTc3JEWGVsazZVU2NMdjhFL0hWYnJ2eGlN?=
 =?utf-8?B?NHpaWlhiNmt5L3poZE8zQXQzZ3ZJTVQ5MG1Ub3RscXc4eXljTkxtUDJLQVNr?=
 =?utf-8?B?SkMrU2MzaUVjbkUyVTZvZVkwM0E0MFlSaU9IYVQxRjh2Ymtma0VVQVBDU3JL?=
 =?utf-8?B?TStrcUt0L1JDVFR3NUdERnptZDhrZWRoWGhTK1FoNzRkZjI5bTVBM2F3N3NT?=
 =?utf-8?B?Sm5uUHFUZ0pCUlNORHRZbHVPbHdSSlQ4bGtMeTB5NnlsTDZGZ0lqYzdTTVVn?=
 =?utf-8?B?L0VnQU9XNUdmWGhTbElGeUVGWjdmMG9CNlk3dlV1TVpuK0hlYzBVMU1xd3dh?=
 =?utf-8?B?MVY1V21ueE53Zk5HZEZoYys5bHBxYjRiWHpac0tlOHlqeWNOU1ppUy84T1Fo?=
 =?utf-8?B?cnhTNHJ1c2Q0QW5oMmJ1Q09sOFpjMWNFYW9UZWJJbkZuRmYwcXJMNUl2Zjd3?=
 =?utf-8?B?SnIyYzk1cm11TlFOSy9EczNYMVgvMTRMVXZNUEhJVXBjNDhnQXpreTNRcWh0?=
 =?utf-8?B?am9jNGZDRWI1R3BsNjJBenBKUFVaRVU1OFUvUm4rU2ZtZlpPU0d1ZDlqQWd6?=
 =?utf-8?B?bzJ1eG4vbkpJWmdpUk50S0tMeThOd3JsOGFjWVNGUnZwUC9tOHdzQUlqZ2pH?=
 =?utf-8?B?UmRFaU00ZExrdWJnanpJbDVYSkNORlJ5OExiUnhZVnpvRkZvOHdIanVJL1FG?=
 =?utf-8?B?ZjdLYkN2MWczMUFYSHYrZ1N4MUlNRS84dE93WE0ybGRHWWRoSXhwWFdtMW56?=
 =?utf-8?B?WHBkZnA3UnhiN0pYdWdHcmpRTHFlZWZNYmROOVpadmduMzRvQm1ZVG9ySzRl?=
 =?utf-8?B?ZkhIWHFoSk1ZV1lWWU5DWGxqaDNNbmtua1FBbGJEWnpTcDV4RWdNRklrZnZO?=
 =?utf-8?B?TStNTjN0UDNCMkxKYWQ2bmM0NDRvWnVEY1RGbWtLb1FHaDVuQzFPWFNZZmF6?=
 =?utf-8?B?RTViOURFcFF3YjRzSXZvWURrMEVFNEwwQTJUT1RwcVd1SjhQcm1ueW0rOTRW?=
 =?utf-8?B?MWVCei91UVI3RDJiVUwvWlEyWnFEN3VZZGd5TzZiNWQ0SHB2VjBibjR5aUMx?=
 =?utf-8?B?UmVIN1hEZzBDS3VXUGhKQWQyS2JTc0kwODVrMWsvQzc3ZCtRTzVUeTk3Mm9C?=
 =?utf-8?B?QlN1SVJPRmtSZzE1QkFVOGt6cVVsUXpieGtrTjhodVg5aXhCeS9jNUtrbDla?=
 =?utf-8?B?QzRtYWRxNlhYL2FwbDlwTHZXbGF1SkhyZ1lxNWlHdkoyUGU4RkpKcTR6dVNk?=
 =?utf-8?B?Zk5wY01Ia2tjWkhvcHRORFhIVjNvaDIxMnhJOHJDdkY2eVlDZ0lQek03R1JI?=
 =?utf-8?B?bzZYdDR3bVFHaFhpS2hDZFAvMXdNVU5sWE9taDNpaG1ObHpNWHJwM202MEJu?=
 =?utf-8?B?cG1mM1FBbEJLMWhMZU9tSk1jZ21yY1FZVzRhUERMMmplaWpNM1hSZE1pVHBK?=
 =?utf-8?B?WnVZR1FhOUlKTENPVnJpYTRvdnA4dms4Y2k2eXBlN3Y5Ui9Rc0dzMFcyLzJF?=
 =?utf-8?B?ZEhhd3hWd1dRYWw2YjlwbVNBcDI0dmVzOUJWcDlxd09hNy9MRnl5RTR0S3lR?=
 =?utf-8?B?bTNTQUVQcnUyVXpZcWhvMHBJOWFpYW9vMzh6UFJPeC8rNkovOENHWTNRSlBw?=
 =?utf-8?Q?LwwYCYJawzUmXAl/cLfF4jZkF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24AA875F96FAE14097171D7FC883E2B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ENYMlNz8s+NnWJH+N5gWZ6j9PCZpCCNCK6NorTdB5k2kDqwGEYRorcd+xc3oe/JhyJKJ3/Q9e1I/DRAQxSyEDb5kq/k/IdR5CS47f5/iye1BI7ckXmvq50tpMXFGcpTgx65Dmew5053Q8r3wgNfeitZ9RgllX7Qdw2znmttFlbwXoPvqbadH2BeZoIsq059ywl13+Ptz4oKr8PUVLChfD2yBvHCf3C4nlVFWQpqTmvNU1lCRk+cassDUXMLkH8SGKUGHCTgkKHjdFmE1c5lQ1MUEcULkgCZLPcvIG02ukesSbTYJzx2XQFyZI/I1HcHBWqsjqb94GIoUQGtXwmCjI9xsuEKViACyMOgMRwzJuhMubBcHPCaYIOgO1DxnqsoZ1eeUwhD/G0t9OinbEeafdnQZgdaWHDrRq7eZLWIPViKnKdk74ZLn2jxMYGH3+CoPwoyvJzwtXqe1HkaFR0jOORcyjbpHF3k5o2W2d+Ixe8zZXJvq0w+jcQRAbriGzAgrkVEG2pTjEkjWAG5Y93ih5dxTIP2wyshtABUz77dnjRV0HP+4qvYKtyjU2c8QXoC81942PgwT8HTUAsk5/XAZenqKyBNIj3psDNVJOH2TWADX9q0U/sM9cvQqYSUWsk2oaaMYypCxtj6O0Gd5qaY18I71K0ViKXDHKCD1pKDpKVEBTEfgNR/LLWFpSmRd9+44GwyimzM4hQ0efYFTdCRnnmR+xoy3OW7NnnL0TD44hptWq1YhDvpNLQUvfpSc0ZH3xePGgi5yDM1BwpONCCiQZDX8PUvl/8QjXICrbMGx4q2XM7VEj+cIwkK6pjVpfFXA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fee7e4-3012-43ba-3a62-08daf2632f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 17:01:43.1941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ja+7lKe3zMaYIq/YUSf0h/SAURmRCHscCEYyceKuzqvybDc24T6YfCun2gbq9rj1Zg6KXzs3gSXD0EHPOuwDu5VDQ10ucSCjhe0myUA2wtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998

T24gMjEvMTIvMjAyMSAxMjoxOCBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjEyLjIw
MjEgMTA6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaXRoIGFsbCBpbmZyYXN0cnVjdHVy
ZSBpbiBwbGFjZSwgYWR2ZXJ0aXNlIHRoZSBQS1MgQ1BVSUQgYml0IHRvIGd1ZXN0cywgYW5kDQo+
PiBsZXQgdGhlbSBzZXQgQ1I0LlBLUy4NCj4+DQo+PiBFeHBlcmltZW50IHdpdGggYSB0d2VhayB0
byB0aGUgbGF5b3V0IG9mIGh2bV9jcjRfZ3Vlc3RfdmFsaWRfYml0cygpIHNvIGZ1dHVyZQ0KPj4g
YWRkaXRpb25zIHdpbGwgYmUganVzdCBhIHNpbmdsZSBhZGRlZCBsaW5lLg0KPj4NCj4+IFRoZSBj
dXJyZW50IGNvbnRleHQgc3dpdGNoaW5nIGJlaGF2aW91ciBpcyB0aWVkIHRvIGhvdyBWVC14IHdv
cmtzLCBzbyBsZWF2ZSBhDQo+PiBzYWZldHkgY2hlY2sgaW4gdGhlIHNob3J0IHRlcm0uDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhh
bmtzLg0KDQo+DQo+IEkgd291bGQgbGlrZSB0byBhc2sgdGhvdWdoIHRoYXQgeW91IC4uLg0KPg0K
Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaA0KPj4gQEAg
LTI0NCw3ICsyNDQsNyBAQCBYRU5fQ1BVRkVBVFVSRShDTERFTU9URSwgICAgICA2KjMyKzI1KSAv
KkEgIENMREVNT1RFIGluc3RydWN0aW9uICovDQo+PiAgWEVOX0NQVUZFQVRVUkUoTU9WRElSSSwg
ICAgICAgNiozMisyNykgLyphICBNT1ZESVJJIGluc3RydWN0aW9uICovDQo+PiAgWEVOX0NQVUZF
QVRVUkUoTU9WRElSNjRCLCAgICAgNiozMisyOCkgLyphICBNT1ZESVI2NEIgaW5zdHJ1Y3Rpb24g
Ki8NCj4+ICBYRU5fQ1BVRkVBVFVSRShFTlFDTUQsICAgICAgICA2KjMyKzI5KSAvKiAgIEVOUUNN
RHssU30gaW5zdHJ1Y3Rpb25zICovDQo+PiAtWEVOX0NQVUZFQVRVUkUoUEtTLCAgICAgICAgICAg
NiozMiszMSkgLyogICBQcm90ZWN0aW9uIEtleSBmb3IgU3VwZXJ2aXNvciAqLw0KPj4gK1hFTl9D
UFVGRUFUVVJFKFBLUywgICAgICAgICAgIDYqMzIrMzEpIC8qSCAgUHJvdGVjdGlvbiBLZXkgZm9y
IFN1cGVydmlzb3IgKi8NCj4gLi4uIGNsYXJpZnkgdGhpcyByZXN0cmljdGlvbiBvZiBub3QgY292
ZXJpbmcgc2hhZG93IG1vZGUgZ3Vlc3RzIGJ5DQo+IGFuIGFkanVzdG1lbnQgdG8gdGl0bGUgb3Ig
ZGVzY3JpcHRpb24uIEFpdWkgdGhlIHNvbGUgcmVhc29uIGZvcg0KPiB0aGUgcmVzdHJpY3Rpb24g
aXMgdGhhdCBzaGFkb3cgY29kZSBkb2Vzbid0IHByb3BhZ2F0ZSB0aGUga2V5IGJpdHMNCj4gZnJv
bSBndWVzdCB0byBzaGFkb3cgUFRFcz8NCg0KUEtVIGlzIG9ubHkgZXhwb3NlZCBvbiBIQVAsIHNv
IFBLUyByZWFsbHkgb3VnaHQgdG8gbWF0Y2guDQoNCldlIGluZGVlZCBkb24ndCBjb3B5IHRoZSBs
ZWFmIFBLRVkgaW50byB0aGUgc2hhZG93cy7CoCBXaGlsZSB0aGF0IG91Z2h0DQp0byBiZSByZWxh
dGl2ZWx5IHRvIGFkanVzdCwgd2Ugd291bGQgdGhlbiBoYXZlIHRvIG1ha2Ugc2hfcGFnZV9mYXVs
dCgpDQpjb3BlIHdpdGggc2VlaW5nIFBGRUNfcHJvdF9rZXkuDQoNCkJ1dCBob25lc3RseSwgdGhl
cmUgYXJlIGZhciBmYXIgbW9yZSBpbXBvcnRhbnQgdGhpbmdzIHRvIHNwZW5kIHRpbWUgb24uDQoN
Cn5BbmRyZXcNCg==

