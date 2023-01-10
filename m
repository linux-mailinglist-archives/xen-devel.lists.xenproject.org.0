Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70866460D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 17:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474819.736192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHUY-0002QX-Ij; Tue, 10 Jan 2023 16:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474819.736192; Tue, 10 Jan 2023 16:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFHUY-0002Nt-Fa; Tue, 10 Jan 2023 16:28:50 +0000
Received: by outflank-mailman (input) for mailman id 474819;
 Tue, 10 Jan 2023 16:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFHUW-0002Nj-N7
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 16:28:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7780029-9103-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 17:28:45 +0100 (CET)
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jan 2023 11:28:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6152.namprd03.prod.outlook.com (2603:10b6:208:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 10 Jan
 2023 16:28:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:28:28 +0000
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
X-Inumbo-ID: d7780029-9103-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673368125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2+qcYU4UZAVz66L4Kyc9H4n1d6XZgfoIpmG0t1Jr0c4=;
  b=fEfDqcpz7yOBN5xBeBUm2P9k471CqayzU0yIQNS1HiaQkwALBfrx3L9X
   w9J7s6fEWTXwQK/XMsTmFTipjJpAhsN2x6J4ED/U8fo0kEIS8FJbSa2no
   BgdHtGPf80AvPoQqIb3lmHHQ3LOXlq/O+s3jxf8LvMbYWccBPArEvihPj
   k=;
X-IronPort-RemoteIP: 104.47.57.40
X-IronPort-MID: 92002746
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:38j9TqlkxtYV1tD8TzN9LYzo5gxRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWUD/Ta62DN2KjfIgjaI2190sBuceHyt5qGQNq+C1kQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5QeGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQCLTtXUzaDvPP10qC0QfZLrMQOKeC+aevzulk4pd3YJdAPZMiZBp7svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3jOCF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNITOXiqaI06LGV7nFLECVVSEKXm+nnj3O1We9PC
 mJX4QN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnM0rQ3os3
 1yAndLsDBRutqGYTTSW8bL8hTC/JykTa3MDbCksTA0Z7t2lq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vvt63jp3ATwpw/QOOWGugtll9fNT9O9Tu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yTyFWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:UdxFhaofos3pBEv4+QSmJG0aV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="92002746"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKVNRsikJofMAuxFMCazZQ/8Cn9/k7LfAg8UNl43nd5X8advfHg2KUUyeQMes+Ds4wERlaNNF937U46CtjIih0g7Hq12P0mFuk0lbcqk3GoySCYEAH09uogdRS1dIZG/3uCS016SKX0PLLnNQhK1Fcxfqh8G3mIpJ0xzkDbZuVv2ue11HRdYVh1RX2GsJVJLtfHFFdR7Cukqhsj/LHORYNJYLXRGzyTnGrZJmM+9ETMtrzUEW/kESa4KdQPBXQgUKSXx7UdOPI+SHQlfu556ls/g1Hg9h9LlyXwTm9bg/E3YM2WfODQsiP2N47SxZXbK5k99SyJLBESjkSgySjbTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+qcYU4UZAVz66L4Kyc9H4n1d6XZgfoIpmG0t1Jr0c4=;
 b=nf/7FVjxemscHXp/rjCgDdwlEbsBMNLWqOFsM9LIPw2rqS5d9rq3K0sgMGT1P4ctKyZH5REVYyOQbE8II/UXylEDsSHXlw7hHkfaESF3/giWmjuZQuhI56grVvSjMKj30pQf6WWyFrAOjVsMp5GwAtH/dPLDWgYPtIFvb6Osaml/7CXf9XWVV+lly1drRgtZSei2pwWH1Tij267DkewcjsM0/+UpSXyArBhGYHs7xM52Y/z2sSR162D3vORnEXypmaV1h9cz0RL07tOqKB/zaHBbWUCcuqgFSev9jXIJ4mg4lHhhtwstZvle7WOiE4t+JZFa9Y8SKjR/Bo6j3jjIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+qcYU4UZAVz66L4Kyc9H4n1d6XZgfoIpmG0t1Jr0c4=;
 b=aF1By0RK4TPOhH44Z8LezJVJJ4k9czfJxV21bTbHrWg6+WrxziWtgCinRQpl9i/9vqqMd+KuzPtHTn/v465oV8C0e7N2iV0MO8epC3sLZ/RAf8cmRGtO8X9rGiGLz+obeVYNsNgK+ikOJoD4gezxSCcQJcvQbyoa8dtIRvkvTzw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start
 of day
Thread-Topic: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start
 of day
Thread-Index: AQHZJCMapaYe8MLA1UOWoaXJDH0eEq6X2D6AgAAAnoA=
Date: Tue, 10 Jan 2023 16:28:28 +0000
Message-ID: <433003aa-e3a9-b717-76f2-c62b0a31003f@citrix.com>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
 <20230109120828.344-2-andrew.cooper3@citrix.com>
 <80b2ea4d-d52b-14c5-38ea-b8ab7e3a713c@suse.com>
In-Reply-To: <80b2ea4d-d52b-14c5-38ea-b8ab7e3a713c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6152:EE_
x-ms-office365-filtering-correlation-id: 3051b1bd-e71d-42d8-3f47-08daf327b491
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F43vuGmoZAz64MIVsoTk7wHo3FQd+ndIKQS7AqLizJ8vW1scoUFNxTubdQQdph3ydHhF7oFZ3oZCTW+wXqE3gj/AEMhB0YKGqNA5eMG2Ac+E0cZNa9Mw26ugQy5/21sVvknURd3MBZQr9GLH1WH8Qk+JgjyWtBSpZwV1cYZVgjrg8anA80XkylEuJoHgrWqaoQ5T/dTKKcceaR1CrlGSpg/2kd8uM52fB1C2J02gLjhqVM57zfE/XAzM9Qo9UsNDos+mearAx6wJAw7OYME+SJsvzM6zuGWLZIBYpy6nOvkGSrsTygZaEgUQ3Y7551BF8mzDmGZA42aYuld2YonvxM9fzM/sDiyMki9al17odcXzYCP/tTvRfPucJCQRtn6RILzgI/dvr4nQaNxZBVVyOawVy4QoDzfE03KKbhkx8RBc9e93TZ2177816HpvLQ68in5IWCmDd+6suKt8F+x3OTtOysvBDhTn60RppTQTnrm/WmHy/QmD4oeYEFk8Fl1GmVb77WBiVXPl0olGwoICRHMpngrKga7431rGOMmqgebWh70Yws0m+cYfoZ31LQQyPKE1P273evk79dLcRy50MD2BgImwOfZyFXkunhXLiXT/HQhopqFuD7z/b3STqW4TGQ1tXqeqs4loaExxsN8vTTTcUcVikqoHC7a4FSlpbwIInej4gEwo04adw31VmMHkZh4+3pWgyjM0nhs9jzrkr0T+wjxV/Co3MIgEgyn5Bo8EH8Os/BRPEzNFMiFWxnHfh/MFJNwpf+gU/oz18UVE8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(6512007)(26005)(186003)(53546011)(6506007)(31696002)(71200400001)(38100700002)(86362001)(54906003)(2616005)(316002)(110136005)(82960400001)(2906002)(122000001)(41300700001)(38070700005)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(8676002)(76116006)(91956017)(5660300002)(36756003)(8936002)(83380400001)(478600001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkFnbTZOTS8xYjV4TTBvTkdIRGk3RDFWZTBRWWNlKzVNQ05NTmFJa0JmbVpG?=
 =?utf-8?B?T3prbXh0cjFiTjZYMzJHWlI2d01iSHFYaklXWW1na3ZkTWtOMFpkMzRHbTR6?=
 =?utf-8?B?Mm51ejZtNXU4NHZ2ZlBkaU5hekhGOThXRWRpSnhIcTZxRFdjSDNzMjhzMlNo?=
 =?utf-8?B?cVgraXJkMDczUDc0SEhEUk1peWFUQzEvTkt5akkwUGUwMVJRdjRJZnUzSGNO?=
 =?utf-8?B?UVRnWGtSS3dBYStoM3dPaE53U05zak4yTHh5M3Y5SE5IQkxObDVuQ2p4TE9t?=
 =?utf-8?B?UE1LK09zNVhEczVlUnkzVmwycnhaV2RMd2FSNTM0MEZ3bG8wNm5PS2ozc1Qw?=
 =?utf-8?B?dzBoQ3JDWDhGeHRaamJNZnJiT1FiUWhubmt1WVFCQlN3ZEdEdXVoZzV5dFVm?=
 =?utf-8?B?ZmYyc3NkWm91ZnJhQUUxRVFxVE43aC9YVk8vWElrNm9qM0xIc1JHVG1zZkdk?=
 =?utf-8?B?bFF5bEJpUGgxTjZweVlTeGJORXVkZVNIbFlYL0llRG9VTlp2ZEJOS0I3V0N2?=
 =?utf-8?B?WmJqdkpXaWZZRkRKL29hSXhKVk5nRStNMkZKMmZMdzRwNDN5QVNJMS9EYmNs?=
 =?utf-8?B?cnlad3M3Y0VzQ3NCOUFpaWNMTG9NV05LRnBYMWNQbnJ1NDI3TEl3L1ZDekpD?=
 =?utf-8?B?STliMmgrZlVpaGtSZXVITFYxZndwdXoyc1hJdUpBMnc0bHhXejd2d3V4dU9B?=
 =?utf-8?B?Rzc3cEtWWFFHYm1DKy9mdFpySUJPSWwwb1NRTG9kL1ZhNHZOZjRwNWZjVjZu?=
 =?utf-8?B?T3BsZGpzVHV3VU9pT29HL3U2b084YXAvUEthdjZnVURodkgzQ3dKR1JmNHFp?=
 =?utf-8?B?UVplbUNhK2VJMGkxdjBhckJtMnVJcUNiVktXcmRYZysyZ0p4VFdMamlOUldZ?=
 =?utf-8?B?dVZRSzRQc08wZEpEMEg0cW5DZlUwa3pkSVdNcEtHSHZMNmo2NDZGR1dOSjZx?=
 =?utf-8?B?Y3I5RW4zOGJTeW8xakdRTjduZkZRQ0NYRWZvRGJFRVFzM1FaYmxFYS9YYXpt?=
 =?utf-8?B?VjU0UndBYmVSd0hkZWlINnc5OGZnUlhDNnAweHZoSlYwMkZ6OElYbWE3NTVM?=
 =?utf-8?B?Rys3TldjL1BGZ3hZYzZqWGNSZmZvWk1tcUVza0IzcDlJYmJxSjBHS3ZaOTFr?=
 =?utf-8?B?d3FzdmF4UitDYWFUUE51SzB3bXZRZngycEhRNDRpTFJzR0kvM2VZUXR2WEZD?=
 =?utf-8?B?K1RSQTJDTDE3aHNaVmRFMUdvVWJ3d0YyTHU1QTduOUh1Mjd3eGg0M01VTWRV?=
 =?utf-8?B?OTBIdVJZNE5JdVFxaUtFTjFtcUxjWGNSdHdCVjhPN0M4N0lVazRLaDJLelFs?=
 =?utf-8?B?YVpGSUpGR2kwdzdXaHhoRHVLZ0dKa2N4MXJNT1VqdkpwNXhpK1dlSHVRY240?=
 =?utf-8?B?U1lhL2N4UlhzcUVya205aEpYQVlSSnozNG9ZaU0zUFN0TDUya08zVjQrRFBv?=
 =?utf-8?B?a25yTDdUQW1MNDBOUGNObEZMY0U3TWtudDhDWXQ5WlpybStNU2w0NHMvNEli?=
 =?utf-8?B?Skp3ZXptL3Y0eUpGeHV0V1FFazF1VEhBM1RGaGRLcUZGQmJ6Vmk0ek5HVCtZ?=
 =?utf-8?B?ZXB6cTVaNnJiRzdlOW56NzVobFh0NVJkK2sybi9FSzFEZUFucDZLTHgyNlFl?=
 =?utf-8?B?OU04WXlNc3Z3MGMwc2o3WVhLSEVyaTQyMHFmSkl1RktwR2VJanRXQSs3cFFJ?=
 =?utf-8?B?VUJKbi90QVJ0Q09WeU42enFibUhsSklsOEIvRUpsU1UyaUEvKzlZcVJiYStD?=
 =?utf-8?B?U3VtaFZtVTVXWDMzOVQxcFRaZVM1ZGhqK2RQU3lLVUt6YWk5MktmYUF5c2xQ?=
 =?utf-8?B?bEJaZnB4NnNlWkZaK05VTFNmeW9YVEhLbENWSjJiNVdUcGVEdXA3TGY0Z2xV?=
 =?utf-8?B?WW1kV3cwMGVwQjdOdm42SGJaOTR5cm5MREZZZlVsQkdGZkF4MVdmQ3F5S1pR?=
 =?utf-8?B?T28rYXBZSnJuYkxLYzk3RHlqRzkxRDQwTGpmYmhCaVYwRXpuY09xaDdKaFcr?=
 =?utf-8?B?bmJsK2NmenBHSG0zU0ZlcHZVYm4xZjJVaThhZDZCUUJrOVNoMXNwZHRqWS9Q?=
 =?utf-8?B?eUowbXpENjVJSUhoTjQ4YWZaeXlPcVZ3dTRuWDNsMGJMajROS2dpRjlTNTRB?=
 =?utf-8?Q?OZYFccdLwPmng+PNqPbP03ZFD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <852B1E7D7C17AC468791B1F49CE3F942@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pF6Fzb0BOBtQRtC2KwF3R6X4K8GzZrVyxMg1Mm3prZRq0pZq3C7zoF5rWi2HUPsbGaKq8Gv4HEe3RTQK8wP/4B5wJ8M0oN0d4kUGV7hJ8A1e2+rPjIdel4gv0bvLhXR86fNDYpm4HGGgfW2123xGgkF1+8gijp918ot1R6O1X2SlWBnQjJYM7v5BvUbz2LGeAC+9CZxJS3MHAeXQQmwjL1BMGAcdbuKcWNPlaAJJ/0NYFwmQvT/C9boLTR7VYc0gqWThdFwz0BqewUaQPosPnkm/BWYLX1nS7nkpahCyhI6nMi7mp9EtOhZtTXVI2tBg/c2jP44Yh6RdbCVCzRmmIfbpp7e3GGJYMFi9w1CRyqFcD5DxNFAw+z1RHx76Be6RI2itmQIFLVd03GOY7SZUmctJhlWP3Vy9fWOHy4P5lbBdWwioUXfmHtwO+KmlNAXtiaG0cTuuh3VoZPI+f+j4MkUZYUkaLdXlLF9AVh0pt+SppCHlBwn0vFz7qNVzs13nXneWsnTgEVqw/hZwfR+oD2UvHKI4lw8+OnT3lICujGxJhuTYg+YuqhEMtlV9ydNlHBMWkBFDl/quUgmiTmuheBs4qX8TWaKOy1fSfgbsjBhV8ya9A6uCD4eLCS/KEB/lE+6dH/OESnmcATzz11yTJYRIgs0Dc387DdBw4OfR0lsPtM5hvUidfnaY5ru7a3WT2GHT9Euf78e0duHEtbvsPjqTEBrWKjkYYtwJEbR1naqO3r4KA72Q7LvF8S4PKPzpTIjbjZoWEPCXuyv91vpY0w9JxZdOCaldzygGnrwdgRlnMzeI6swtEHE1C5/VGkoLEDdQEuQ9VMB290AawRpdl5PVWFKE3WX2PdOXx+vtrq0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3051b1bd-e71d-42d8-3f47-08daf327b491
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 16:28:28.4569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXPl21UYC0HtA2lVbGt2Azk93qhqmMczRSa0SaSlTxIHaLrFzLZFRmZ+puZGgZYWMExwqYqEXcSKwCX1vakRLTRw2e/iBv4yHUwIszg2zsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6152

T24gMTAvMDEvMjAyMyA0OjI2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDEuMjAy
MyAxMzowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFRoZXJlIGlzIG5vIHBvaW50IHJlcGVh
dGluZyB0aGlzIGNhbGN1bGF0aW9uIGF0IHJ1bnRpbWUsIGVzcGVjaWFsbHkgYXMgaXQgaXMNCj4+
IGluIHRoZSBmYWxsYmFjayBwYXRoIG9mIHRoZSBXUlNNUi9SRE1TUiBoYW5kbGVycy4NCj4+DQo+
PiBNb3ZlIHRoZSBpbmZyYXN0cnVjdHVyZSBoaWdoZXIgaW4gdm14LmMgdG8gYXZvaWQgZm9yd2Fy
ZCBkZWNsYXJhdGlvbnMsDQo+PiByZW5hbWluZyBsYXN0X2JyYW5jaF9tc3JfZ2V0KCkgdG8gZ2V0
X21vZGVsX3NwZWNpZmljX2xicigpIHRvIGhpZ2hsaWdodCB0aGF0DQo+PiB0aGVzZSBhcmUgbW9k
ZWwtc3BlY2lmaWMgb25seS4NCj4+DQo+PiBObyBwcmFjdGljYWwgY2hhbmdlLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IHdpdGggb25l
IG5pdDoNCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiArKysgYi94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPj4gQEAgLTM5Niw2ICszOTYsMTQyIEBAIHZvaWQg
dm14X3BpX2hvb2tzX2RlYXNzaWduKHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAgIGRvbWFpbl91
bnBhdXNlKGQpOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGxicl9pbmZv
IHsNCj4+ICsgICAgdTMyIGJhc2UsIGNvdW50Ow0KPj4gK30gcDRfbGJyW10gPSB7DQo+PiArICAg
IHsgTVNSX1A0X0xFUl9GUk9NX0xJUCwgICAgICAgICAgMSB9LA0KPj4gKyAgICB7IE1TUl9QNF9M
RVJfVE9fTElQLCAgICAgICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfUDRfTEFTVEJSQU5DSF9U
T1MsICAgICAgICAxIH0sDQo+PiArICAgIHsgTVNSX1A0X0xBU1RCUkFOQ0hfMF9GUk9NX0xJUCwg
TlVNX01TUl9QNF9MQVNUQlJBTkNIX0ZST01fVE8gfSwNCj4+ICsgICAgeyBNU1JfUDRfTEFTVEJS
QU5DSF8wX1RPX0xJUCwgICBOVU1fTVNSX1A0X0xBU1RCUkFOQ0hfRlJPTV9UTyB9LA0KPj4gKyAg
ICB7IDAsIDAgfQ0KPj4gK30sIGMyX2xicltdID0gew0KPj4gKyAgICB7IE1TUl9JQTMyX0xBU1RJ
TlRGUk9NSVAsICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfSUEzMl9MQVNUSU5UVE9JUCwgICAg
ICAgICAxIH0sDQo+PiArICAgIHsgTVNSX0MyX0xBU1RCUkFOQ0hfVE9TLCAgICAgICAgMSB9LA0K
Pj4gKyAgICB7IE1TUl9DMl9MQVNUQlJBTkNIXzBfRlJPTV9JUCwgIE5VTV9NU1JfQzJfTEFTVEJS
QU5DSF9GUk9NX1RPIH0sDQo+PiArICAgIHsgTVNSX0MyX0xBU1RCUkFOQ0hfMF9UT19JUCwgICAg
TlVNX01TUl9DMl9MQVNUQlJBTkNIX0ZST01fVE8gfSwNCj4+ICsgICAgeyAwLCAwIH0NCj4+ICt9
LCBuaF9sYnJbXSA9IHsNCj4+ICsgICAgeyBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLCAgICAgICAx
IH0sDQo+PiArICAgIHsgTVNSX0lBMzJfTEFTVElOVFRPSVAsICAgICAgICAgMSB9LA0KPj4gKyAg
ICB7IE1TUl9OSExfTEJSX1NFTEVDVCwgICAgICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfTkhM
X0xBU1RCUkFOQ0hfVE9TLCAgICAgICAxIH0sDQo+PiArICAgIHsgTVNSX1A0X0xBU1RCUkFOQ0hf
MF9GUk9NX0xJUCwgTlVNX01TUl9QNF9MQVNUQlJBTkNIX0ZST01fVE8gfSwNCj4+ICsgICAgeyBN
U1JfUDRfTEFTVEJSQU5DSF8wX1RPX0xJUCwgICBOVU1fTVNSX1A0X0xBU1RCUkFOQ0hfRlJPTV9U
TyB9LA0KPj4gKyAgICB7IDAsIDAgfQ0KPj4gK30sIHNrX2xicltdID0gew0KPj4gKyAgICB7IE1T
Ul9JQTMyX0xBU1RJTlRGUk9NSVAsICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfSUEzMl9MQVNU
SU5UVE9JUCwgICAgICAgICAxIH0sDQo+PiArICAgIHsgTVNSX05ITF9MQlJfU0VMRUNULCAgICAg
ICAgICAgMSB9LA0KPj4gKyAgICB7IE1TUl9OSExfTEFTVEJSQU5DSF9UT1MsICAgICAgIDEgfSwN
Cj4+ICsgICAgeyBNU1JfU0tMX0xBU1RCUkFOQ0hfMF9GUk9NX0lQLCBOVU1fTVNSX1NLTF9MQVNU
QlJBTkNIIH0sDQo+PiArICAgIHsgTVNSX1NLTF9MQVNUQlJBTkNIXzBfVE9fSVAsICAgTlVNX01T
Ul9TS0xfTEFTVEJSQU5DSCB9LA0KPj4gKyAgICB7IE1TUl9TS0xfTEFTVEJSQU5DSF8wX0lORk8s
ICAgIE5VTV9NU1JfU0tMX0xBU1RCUkFOQ0ggfSwNCj4+ICsgICAgeyAwLCAwIH0NCj4+ICt9LCBh
dF9sYnJbXSA9IHsNCj4+ICsgICAgeyBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLCAgICAgICAxIH0s
DQo+PiArICAgIHsgTVNSX0lBMzJfTEFTVElOVFRPSVAsICAgICAgICAgMSB9LA0KPj4gKyAgICB7
IE1TUl9DMl9MQVNUQlJBTkNIX1RPUywgICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfQzJfTEFT
VEJSQU5DSF8wX0ZST01fSVAsICBOVU1fTVNSX0FUT01fTEFTVEJSQU5DSF9GUk9NX1RPIH0sDQo+
PiArICAgIHsgTVNSX0MyX0xBU1RCUkFOQ0hfMF9UT19JUCwgICAgTlVNX01TUl9BVE9NX0xBU1RC
UkFOQ0hfRlJPTV9UTyB9LA0KPj4gKyAgICB7IDAsIDAgfQ0KPj4gK30sIHNtX2xicltdID0gew0K
Pj4gKyAgICB7IE1TUl9JQTMyX0xBU1RJTlRGUk9NSVAsICAgICAgIDEgfSwNCj4+ICsgICAgeyBN
U1JfSUEzMl9MQVNUSU5UVE9JUCwgICAgICAgICAxIH0sDQo+PiArICAgIHsgTVNSX1NNX0xCUl9T
RUxFQ1QsICAgICAgICAgICAgMSB9LA0KPj4gKyAgICB7IE1TUl9TTV9MQVNUQlJBTkNIX1RPUywg
ICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfQzJfTEFTVEJSQU5DSF8wX0ZST01fSVAsICBOVU1f
TVNSX0FUT01fTEFTVEJSQU5DSF9GUk9NX1RPIH0sDQo+PiArICAgIHsgTVNSX0MyX0xBU1RCUkFO
Q0hfMF9UT19JUCwgICAgTlVNX01TUl9BVE9NX0xBU1RCUkFOQ0hfRlJPTV9UTyB9LA0KPj4gKyAg
ICB7IDAsIDAgfQ0KPj4gK30sIGdtX2xicltdID0gew0KPj4gKyAgICB7IE1TUl9JQTMyX0xBU1RJ
TlRGUk9NSVAsICAgICAgIDEgfSwNCj4+ICsgICAgeyBNU1JfSUEzMl9MQVNUSU5UVE9JUCwgICAg
ICAgICAxIH0sDQo+PiArICAgIHsgTVNSX1NNX0xCUl9TRUxFQ1QsICAgICAgICAgICAgMSB9LA0K
Pj4gKyAgICB7IE1TUl9TTV9MQVNUQlJBTkNIX1RPUywgICAgICAgIDEgfSwNCj4+ICsgICAgeyBN
U1JfR01fTEFTVEJSQU5DSF8wX0ZST01fSVAsICBOVU1fTVNSX0dNX0xBU1RCUkFOQ0hfRlJPTV9U
TyB9LA0KPj4gKyAgICB7IE1TUl9HTV9MQVNUQlJBTkNIXzBfVE9fSVAsICAgIE5VTV9NU1JfR01f
TEFTVEJSQU5DSF9GUk9NX1RPIH0sDQo+PiArICAgIHsgMCwgMCB9DQo+PiArfTsNCj4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGxicl9pbmZvICogX19yb19hZnRlcl9pbml0IG1vZGVsX3NwZWNpZmlj
X2xicjsNCj4+ICsNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IF9faW5pdCBsYnJfaW5mbyAqZ2V0
X21vZGVsX3NwZWNpZmljX2xicih2b2lkKQ0KPiBQbGVhc2UgbW92ZSBfX2luaXQ6DQo+DQo+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbGJyX2luZm8gKl9faW5pdCBnZXRfbW9kZWxfc3BlY2lmaWNfbGJy
KHZvaWQpDQoNClllYWgsIEkgbm90aWNlZCBhbmQgZml4ZWQgYm90aCBzdHlsZSBlcnJvcnMgaGVy
ZS7CoCBBbHNvIGFuIGV4dHJhbmVvdXMNCnNwYWNlIGJlZm9yZSBfX3JvX2FmdGVyX2luaXQuDQoN
Cn5BbmRyZXcNCg==

