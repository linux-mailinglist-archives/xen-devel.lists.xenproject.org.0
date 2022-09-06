Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F85AF756
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400420.642194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSw-0005um-TC; Tue, 06 Sep 2022 21:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400420.642194; Tue, 06 Sep 2022 21:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSw-0005oP-GR; Tue, 06 Sep 2022 21:50:42 +0000
Received: by outflank-mailman (input) for mailman id 400420;
 Tue, 06 Sep 2022 21:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7yI=ZJ=citrix.com=prvs=2414a9d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oVgIg-0000Cs-Jk
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:40:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d169255b-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:01:05 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Sep 2022 06:01:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6090.namprd03.prod.outlook.com (2603:10b6:408:11b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 10:01:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:01:00 +0000
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
X-Inumbo-ID: d169255b-2dca-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662458466;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YY/6obn/oZCyp1UymDaXYf+htUl6d+AT8k5qFf412T0=;
  b=FMG6aNNcZcepxbqoBKf+aQq+rrjtNrCCSHYXgg2fhTJTzUoY/8K8aDxq
   ifE/2EPNGfEE0uW8fi8/05vOVf4TNIYg9BTQ7iTqdwHnasAMRDquxyqMP
   RWfz76inz5l+WnD3/wtjBfwAk+kiMzdV1HpEhWD1HCnbc+Nt0S9EtH/le
   k=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 82352064
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n/0RGazVOzkECeXagU56t+fexyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 GIWXGvSO/3eMWH1eosgYYXloU4PsZSEmNZnSQo5/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Usx5K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN0tCGo3AKc/5t9zLmNWt
 qVCcxEibUiM0rfeLLKTEoGAh+wFBeyzZsYknCglyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSgNWEJwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTPk2HYqCry2ocjmwvUBJM7RLSRy8d6p2Sr1EA9ViIGUwOC9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYQVt9RO+w89gCWy6DQ7hqZB24LVTpIYpots8pebTkjz
 FqAhd7qLT1prryOSHiZ+6uUrDW9IiwcJykJYipsZRAE5t7liIA1kBPUT9xnHbK1j9v6AjX5y
 XaBqy1Wr6Uei4sH2ru2+XjDgimwvd7ZQwgt/ALVU2m5qARja+aYi5eA7FHa6bNbKt+QSFCE5
 CIAg5LGsLFICoyRniuQRulLBKuu+/uOLDzbhxhoAoUl8DOuvXWkeOi8/Q1DGaugCe5cEReBX
 aMZkVo5CEN7VJdyUZJKXg==
IronPort-HdrOrdr: A9a23:7d7LNap4kYpiOcs5s6YD4zUaV5rUeYIsimQD101hICG9Ffbo7v
 xG/c566faaskd1ZJhNo7+90cq7MBDhHPxOkO0s1N6ZNWGM0gbFEGgF1+XfKlbbakrDH4BmtJ
 uIC5IOauEYdmIK6/rS0U2ACNAnz8CA8Ke0wcnj71oFd3ARV4hQqz5jDACVC0t3QxQDI6EYOt
 6z2uprzgDQAkj+SKyAdwU4tiz41qD2vaOjXx8HGhJiwDWyrFqTmcbHLyQ=
X-IronPort-AV: E=Sophos;i="5.93,293,1654574400"; 
   d="scan'208";a="82352064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbNMt1NUVAIYSyZbOyeXvjSDBJkmo4uktvvsjiD2bxkocKrDf0Q0ehFduniCRMzeRU8oPHRqLLSBzNqJclB77MS0CiYJTwxN8vleI4bsk560w6TGOX/pUYcsh8CufdMf5GYVeZGEiXaKyggr6njKPz0b/m4cv7ekmoLWBD2OYEov4K2SYOJ0nk2GCeJhjGAPSXeJHvlVthGOJxiZRT7D7Ap+mgfm9kWUf/PT2F5U1FowML53wTmPiotoi+Jb/Z6tGSpoiX+kxXpnqvK/QD3wTOn3wz+E2F2suLB2PLzWAkwlC0B1zZkV+84avcDYr/edY0frSZH6oVGU6pIeK6lGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YY/6obn/oZCyp1UymDaXYf+htUl6d+AT8k5qFf412T0=;
 b=Zo831SaqRQG/svZo2KUJ3CGRR5qUe5YumsyfcasHUhHYSsEFpb3o273bK81lyxscTcT5dFI7+QAwwZ9zD3uqQh6g4DdhCcjRKlM1LwMjv5c/BUgeM1OEo34tRYr/t/KpId3qLvZhkl1EVuUQ0zHRJDc/d6AIvFAmdyIYiwGoSl3iFFS+vHELjYYqLXQOmFlZOBQ7BPKcOQcci6QpN3D1haHqze7BeC9w6TzusCQ5AEtYjmFrE9ukA0G+mKQJdejMSsIEe0XRJu2dyDchQFaDxrmZSxZPworsBr4xCqe4WPW9umAKEy3nplMRE3/72OU1BnDuUQxeuVnquEY3X6WPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YY/6obn/oZCyp1UymDaXYf+htUl6d+AT8k5qFf412T0=;
 b=SdRN3BiRjwyGxDAbCewjfNLoa3Q316pBojpHES2VW3pmA3UTt81rG2/0e915s34TjhnMuxsrxqXI1AuK2VkFuykOzBTcOuJydmCLN6TfWBwTKlroibYBulVO4v2t0CyD6mlFQGA2EZnpJ8KXu3mhTDLEd0jV1c94iaUbtWCxyXo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Simon Gaiser
	<simon@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
Subject: Re: Setting constant-time mode CPU flag
Thread-Topic: Setting constant-time mode CPU flag
Thread-Index: AQHYvnB5EClBFIJhzEiMDRLhBKntOK3SL8OAgAACfIA=
Date: Tue, 6 Sep 2022 10:01:00 +0000
Message-ID: <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
In-Reply-To: <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9ab73aa-071b-48e5-330e-08da8feeb370
x-ms-traffictypediagnostic: BN9PR03MB6090:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HFB0oCGBHnhGzm319R4Ckzi+Td3DvEqLIovLyFFU/AVcCndORxh0ZuHQrfn9MKaEgvZR+oPQiQ8rFl287dO4Xt/JUwrwbboWvUj6tMgGmQqfbSo8DCiQbx8VOgwQoltvq/Eeq3GhVs8TZfVgsRbmRK/Bqk/IGpoaBFWtvphyhr5O3jfDCCcEMjj5gHIF1HvyLw1HYRyLRYyx/6g8jwMt5Bkm2UOd2KshchwJQ5WhLGQj6ugau2KDQV8M0v+RnR3u5eghkmvevVnblNMsuPL1Jtf5f8egqqT60Qor3gfKiLN2pzXbc+gjF0IiVqoi2XWCMK8fIGFfWZdYTI5NVgdiB8fRbDlSAMF2UNEgdZ44Zvw0ULNUHhnjhIly1Fl6EX2ok0Mc3NkmF8KpD89VFM1uOvXAQtJq6QiXTKSBHh0D/t66gKkyn3+eYVZoOrWXUp5DZ4hARLKqt06+A+W816z73LYV00/+8tgOKZ07fTTj4aeXRc8OnFxdgT2Z6OcatvvJgGyhasdl1+yxfXWF2k3WHiOIo3MhpuMuwFBHe9pC74mqppW/Q791647eJOSBZu8gM0JNVOS7RfynqpQcb2FRTctEva8LGlyPr4sHn03KDDc95GGPgDpDawcsqxV5AgOsDuz1gQ++8Zrsx6gwmC86286TNcIP3XdS4TICXyO056mqUW9EUe71jThOmAdbjWO2VdN+iWMSll1cSmJf/81DhMnsLfX3DOAS2DckNXew297fdPvceqKvxQ8Xxr9DaewAzWdVik7eetwls7AfqZap92FbLDLqC9zv6rrDyp0Ww5Q9BE5/BIBGPnhpfkTF2Q+NcOJ5+IMLhOpmFHOXV6RrEwJHOiRE1VM/HgsA5YQmjnw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(6512007)(26005)(2906002)(2616005)(8936002)(5660300002)(6506007)(41300700001)(53546011)(31696002)(86362001)(31686004)(71200400001)(966005)(478600001)(6486002)(186003)(36756003)(38070700005)(82960400001)(91956017)(54906003)(66476007)(4326008)(110136005)(64756008)(66556008)(66946007)(76116006)(316002)(8676002)(122000001)(66446008)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE9BRjZUWUptMWxab0FQQ0VWYmFOMW9qZnNENTB0dDBQSGN2NWJ0eXE3WmdX?=
 =?utf-8?B?c3J1TngxNzFmSXNtU1ZJVGlaVXJicVRWTkhPTmk0Skp0VWRJTEJOSGlQeGJF?=
 =?utf-8?B?YkdsYXpQQ2k3Q3Z6U1hqK21uSlkxOG1pcEc1a08xNXRwczl3K0ZUUWZPTFBJ?=
 =?utf-8?B?d3Ntb3NRZ2Z1T0IwcXJwb2FFeHc5eXZUMXB6cFZKbkVTTElydjlnTGJNbW4y?=
 =?utf-8?B?UkJESWN6eHIvS0FzTHVEakJvcXZKUnVTSEpCdmhNRnhJaGNzYnZ2UGo2cERQ?=
 =?utf-8?B?WjZBQWpLQWRYTFRVbFcraVNZVURCWGNBVjdpYzB5cUhPMEhpbEFaWk81Rlp1?=
 =?utf-8?B?TGM1TEZjYlZ4RHN6UGhldk1TY2tONFhYVC9JRWowQTB2T3Q0enRrYndYQm5x?=
 =?utf-8?B?eXM0ZzRMcFBCdmxWZE1YNFIzTVp6L2VJNVdLQytIaWFGLzNqR0p5VVJubnFL?=
 =?utf-8?B?Q3dmWHl3dW0wdW9QWC9xazJrSFl3SXlrSThGNE9RdWR1b1drL09lMGticUFs?=
 =?utf-8?B?RWhITmNqTHA0ZENHSkFLVGFMdGQ5NWk0Y3hpY0lKaWphNlhQSUdVV3VEdmVl?=
 =?utf-8?B?Uzh1TStRbEprSTlPWGs3Ykh6Q1JBUE85TjBOdVhhMmFGQldEcUx5VUVYWUtl?=
 =?utf-8?B?UFNvZVlCTzNPZnFaazBjZ2g5aFR5bDFCRkRvZE0wWktJaDRJOEdCb0psekVR?=
 =?utf-8?B?c05zWWJyS2Z2RmVoWUJXajUyM1VRL1ZGb0JxT0Q0M3ZoNC9XRloybEdjOU1Q?=
 =?utf-8?B?KzlLNWttc3dycnpObmxjMWdCZnI3ejdzdkcxTUwvNm44Nkt6MlEyZmQ3Z1lt?=
 =?utf-8?B?QXZ3UCtIYitKQ1dtbWRWVFovakdyWGZ4RnZyQ25QUFBrWm1ISGJ6WkltdWh6?=
 =?utf-8?B?eVJlV0JXVXIzbzRkY1Fkalk0QmRMcmZCT21qSFZmYjUxaUhBZlJKNnByR3U1?=
 =?utf-8?B?bWM4Qm5OVS9CM2xDejBxUVBOODdJOXZmOTV2VWpLeENUQkszVTUzZTU5Tnp1?=
 =?utf-8?B?TGM3M1dQNnlYY3UwS2RPaHo0QU01UnhIa1VXN3poczIwWmV5TGZFSUEzS0RR?=
 =?utf-8?B?RTh4bTJuekRWRGQ2L3RXWW9rRzdSVk9oTzVaK0MyOWZzZVIvT2hGeTM5UnhP?=
 =?utf-8?B?WDJBSW9nUjZWYXRiNXVvZlR3alVCQkdlWXZiR3g0d3duTm02VjlqSEJIclBx?=
 =?utf-8?B?SDBJQnl4MWorQkFHTktGTzl2NFVNQjRpSjJDTFdOcjhhWGF3aWRQN09mTkg3?=
 =?utf-8?B?cnNJVVExZSsrZGd5YW11NVFWOW12TDhCNzlJK1NmS2ZkMlhMZjAwVnJ0ZWU1?=
 =?utf-8?B?SkszMEpyN0drSFh3RnNMM2xqZXVBSzExbkJQNnN3ODdOd3FKSmxKWDdRZFBa?=
 =?utf-8?B?a2w1cFdiZTFhYVBheXNsT0RKbmNabGRUV2greFNkZFM1OU9TdDRoU3p3M3lp?=
 =?utf-8?B?QWpGR2wrVGtaWnlxOU9GVUVpN1ZyUzFTdlYreFJOelRNTW8vWjZaUUJIS2Ew?=
 =?utf-8?B?UjJJN2UrV2xMcklVVzFPMHl1L0FWcjZPaTBmRC9CcmNncktIUTN4WDdaQXNh?=
 =?utf-8?B?OG1OWDh2RWw5UlZ0N1JUTjFUdk16UWgzY1l1RjNhNS9ZZDgvVnlrUHUzQ0VC?=
 =?utf-8?B?djNFekoxaXR2RUx3VERCM2ZIQzBmRjc1OXZvU0hhNFRrZjlsTXo0eXpzYTQ2?=
 =?utf-8?B?dDhCYmtwcllsT05tUm9sbTFsOXFzVGFGRkV0aXQzZkd3cWc3QitoeWNVRVAy?=
 =?utf-8?B?VjREb2p1aFZodmZyVW9jUTBkcFFHUW1nOTRLVHV4WGxmWXZROGQwczFFTEow?=
 =?utf-8?B?UlhVRDY2Q3VTWXVCbFU5NitKZDJRMEQzeGVMdWFOa0FQSkdIMXE5NjYxQ2dk?=
 =?utf-8?B?OHpmRnFZQVVhMlMvTTR4ZStlOWE5cmkrRTRIenFFUnJPL2gvZ0VWNkVibFNj?=
 =?utf-8?B?a2ZLSCtydEpLY25yVG5CbnIrdzRjenBNb0lKWEdtMjhrWWc4V2ZkQkYrai95?=
 =?utf-8?B?RlVZT21tcWFFQjhUV3hBeFF5dWsrSjdJS0dibzBUM3BRanZwU1Bub3FCeVQy?=
 =?utf-8?B?UFlJWmNINklyU0NDZG9Vc3V5TnVJMFFQYWsvZENmaUd4UU5CS3QxeUhZS29k?=
 =?utf-8?Q?DJ6V4bbTpHoWvuOtFES38KUHq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3689CA72C1F08459A0BAF35F82F8EF9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ab73aa-071b-48e5-330e-08da8feeb370
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 10:01:00.1340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tP25vTL3y/pHEjVsFeaj6i90ltqcsqRSayiHF7Lcr5hoU/cYfsaVQozXqnXh9Ar7faOSak3tl1m/scaKULri8sPB1k8nS3yyfzl1Gapnxe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6090

T24gMDYvMDkvMjAyMiAxMDo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjA5LjIwMjIg
MDQ6MDUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4+IE9uIEludGVsIGNoaXBzIChJY2Ug
TGFrZSBhbmQgbGF0ZXIpIGFuZCBBUk02NCwgYSBiaXQgbmVlZHMgdG8gYmUgc2V0IGluDQo+PiBh
IENQVSByZWdpc3RlciB0byBlbmZvcmNlIGNvbnN0YW50LXRpbWUgZXhlY3V0aW9uLiAgTGludXgg
cGxhbnMgdG8gc2V0DQo+PiB0aGlzIGJpdCBieSBkZWZhdWx0OyBYZW4gc2hvdWxkIGRvIHRoZSBz
YW1lLiAgU2VlDQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1l3Z0NycXV0eG1YMFc3
MnJAZ21haWwuY29tL1QvIGZvciBkZXRhaWxzLg0KPj4gSSByZWNvbW1lbmQgc2V0dGluZyB0aGUg
Yml0IHVuY29uZGl0aW9uYWxseSBhbmQgaWdub3JpbmcgZ3Vlc3QgYXR0ZW1wdHMNCj4+IHRvIGNo
YW5nZSBpdC4NCj4gSSBkb24ndCB0aGluayB3ZSBvdWdodCB0byBzZXQgaXQgYnkgZGVmYXVsdDsg
SSBjYW4gc2VlIHJlYXNvbnMgd2h5IGtlcm5lbHMNCj4gbWF5IHdhbnQgdG8gc2V0IGl0IGJ5IGRl
ZmF1bHQgKHByb3ZpZGluZyBhIHdheSB0byB0dXJuIGl0IG9mZikuIEluIFhlbg0KPiB3aGF0IEkg
dGhpbmsgd2UgbmVlZCBpcyBleHBvc3VyZSBvZiB0aGUgYml0IHRvIGJlIGd1ZXN0LWNvbnRyb2xs
YWJsZS4NCg0KV2UgYWJzb2x1dGVseSBzaG91bGQgbm90IGhhdmUgaXQgc2V0IGJ5IGRlZmF1bHQu
wqAgSXQncyBhIHN1YnN0YW50aWFsDQpvdmVyaGVhZCBmb3Igc29tZXRoaW5nIHRoYXQgaXMgb25s
eSBhcHBsaWNhYmxlIHRvIGNvZGUgd2hpY2ggb3RoZXJ3aXNlDQpjcmFmdGVkIHRvIGJlIGNvbnN0
YW50LXRpbWUuDQoNCkFzIGZvciB3aHkgWGVuIGRvZXNuJ3QgZW51bWVyYXRlL3ZpcnR1YWxpc2Ug
aXQsIHRoYXQncyBiZWNhdXNlDQp2aXJ0dWFsaXNpbmcgTVNSX0FSQ0hfQ0FQUyBmb3IgZ3Vlc3Rz
IGlzIHN0aWxsIG5vdCB3b3JraW5nIHlldCwgc28gdGhlDQpmZWF0dXJlIGNhbid0IGJlIGVudW1l
cmF0ZWQgeWV0IGV2ZW4gaWYgd2UgZGlkIHN1cHBvcnQgY29udGV4dCBzd2l0Y2hpbmcgaXQuDQoN
Cn5BbmRyZXcNCg==

