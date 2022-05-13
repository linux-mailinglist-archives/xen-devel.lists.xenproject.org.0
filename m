Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0045260D8
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 13:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328431.551447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npTJv-0000xM-FB; Fri, 13 May 2022 11:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328431.551447; Fri, 13 May 2022 11:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npTJv-0000uk-CE; Fri, 13 May 2022 11:18:55 +0000
Received: by outflank-mailman (input) for mailman id 328431;
 Fri, 13 May 2022 11:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWrS=VV=citrix.com=prvs=1255b942c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1npTJt-0000ue-OZ
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 11:18:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7714899c-d2ae-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 13:18:52 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 07:18:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4071.namprd03.prod.outlook.com (2603:10b6:a03:79::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 11:18:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.016; Fri, 13 May 2022
 11:18:47 +0000
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
X-Inumbo-ID: 7714899c-d2ae-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652440731;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=On1+Yugy0e7XDuqPkB7HA1FEytdu/qaeXgWsOI6dlvo=;
  b=eeBacfsUzWl9F8lrcBeNhv+gOEK8x6eB+ppFzUNxCO1PMzSbLXL0xP1p
   YKEN3FCpJdtRNRe2Z+LoxKgGugV4mG2jYz28juk6Oxsc3MQWoc1QcaKgC
   xF3Z64c9G97O2rJy7oWtxRNz/rusBOcbJ3J69i3QYWI2rZhmzgboWvD1K
   c=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 71237437
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nLqUw6vbfaa+1cKFEDAcGIQLkufnVCVfMUV32f8akzHdYApBsoF/q
 tZmKWCFa/qKM2CgeIgjOojg9EwCu5HQz4VgT1M+qHw2QSlA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9xL4mcwN1AbiVXTQR8GfNZqLzEBl+W5Jn7I03uKxMAwt1IJWRvZ8g037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IJmm5v36iiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvDGJl1Mti+eF3Nz9ev+4aflwhkWhu
 0Xc71/3BTImM+yD8G/Qmp6rrqqV9c/hY6oCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYDX/JAHut87xuCopc4+C6cD2kACzJENtovsZZsQSRwj
 wDQ2dT0GTZorbuZD2qH8auZpi+zPi5TKnIeYSgDTk0O5NyLTJwPsy8jh+1LSMad5uAZ0xmrq
 9xWhEDSX4kusPM=
IronPort-HdrOrdr: A9a23:xd4KGKyF6GMk3ReIlbovKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71237437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYtqxuapzrtvkNg98Dpvp9snp5YmTlR+Q1DUKEaPxxw30bR0wIIPSz1SRNnTzLOfVMaNMUSrt3Vubmxlu69D5V4OzoB1UD9Z3oeezrkGoPFIEus+DLlD0HhbPex9+BlzH7rIJaq39eTAXNJeGbnDbRKqSGuHHJmKg2qUcB8d0y2i97hC33myO/gP+OrwSL94aXSVtWWxqA35D4WsN41WL/i4gxB4IM9oKHcnp2q4znWiktUmfY3Xz0ot7L8eNRFWJI5JVqDLhfSeMIm92mhvTKxeFUfpiSEfHB1nExhYw692SVyQKQks16tiBw3TY3QP16MSp5iUx/9WnC3RzI3UZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On1+Yugy0e7XDuqPkB7HA1FEytdu/qaeXgWsOI6dlvo=;
 b=QSnAmXpIUkzl38ZxyB1zgvEjRFqkTgBDDsec8TA4AeAwY3Fqaw76ArCt1q6GwbC0Jf8Uv99qR4idr+e0iLtKM7/jsmi3lNeDQieYJzB5LOZBzF9tPcY59KguGISzk5iCeZwvjyyt8DDJ/3PQj7J0dHGyQiAeeZzz+MivzTRLuXttDCBWJmnXId6L+m788RvFsl6Jpdnl334CXoXjH85QqYFs1osmDVvHcE78tj7xaXAvE3klzSl60g+uGcHTlC9w6H0reHtBhUIZDeMc5YDpevszy+Lh7pPWe0bW+yFnczJt9CsvbEeT2QceczcI+OUFcVx6MD7b1pOs8u/wCweIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On1+Yugy0e7XDuqPkB7HA1FEytdu/qaeXgWsOI6dlvo=;
 b=RjYy9QU798tI/sd2uYPdFstQosyPlDzQ5OWB8Jog+eFqHW41ZMKFnpiN8jQSX9jYoc44HUuYEG5jAgvrsp/zAPkdZW/NpPlIQ0MIG5X7MvJ8ZPBed/Mb1eUTgxK2eQFNUUKBah8MZEOUCGcY0/V5j6WEhWqDiHqcun2UL3ZvfnQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Thread-Topic: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Thread-Index: AQHYZrUyMvxAwXZZoEuS2l9n2AZByq0cqQOA
Date: Fri, 13 May 2022 11:18:47 +0000
Message-ID: <ee3aa9f9-1c14-5984-263e-6b606e255bf2@citrix.com>
References: <20220513103500.3671-1-roger.pau@citrix.com>
 <20220513103500.3671-3-roger.pau@citrix.com>
In-Reply-To: <20220513103500.3671-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 060d9c4a-90c0-47db-d9d2-08da34d259a9
x-ms-traffictypediagnostic: BYAPR03MB4071:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB40717857EA109E9341B7465EBACA9@BYAPR03MB4071.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p8x9SpODE9MKgJQQL3/FR7q+8S/fYNeUe29F06C/e4Ucl0B9GFQ9ll5ZfLYMK/5Fw3A/3B+8775RS4b2W5wGTA9KTMqL/Yk4OI7n4oPcJwEqbVAk8JwwFCibkkw0yiI8S52kMfbRqSXmPsKpObIkct+r3E8MV9Ia9M7Bdy1iHCXn63IMqYq73qRScHT3p7ml8u6Wfz/fRzesRs3JUZNqQ/tKgInmUCEvNmZNKg1BFhkV2NZHEcgWOdyJ09qM2UOrmQGe6+z1vXx1ExXNrR15GlWEh4GXZBBVta1H3eHizdjO45T/Gy36nDVX8Y6X7440iZ6O83M2BZ3dM30paGMHlYkL8pU1qBpDOCYkeh98qtyYwRQZvhlNp6u76Jl2HY4FlTbj9quoDIyLECj9YFz9fKa4CG8XSbdqG5i1so8pDOI13E2meFEZNhNWXh3GNpc/wlG8roIBjMs2nuXzOBssZpcHgRkQnExLTTiMZJLQyQ6r5CMT2DFoZLNjpjGH19Dta6hKUszHG674e8pwfXC76t2EPnr9pOJMBsFQNf9yTni00EKCAe1KF5RatpYSVyP6OKM7kPCFRmesfOsF/Ki0Ka1Bk9a7ssSFySn7JBPfjGZ2+Z778XCugV2xl+oB79N9TMwRNPsGfXORwSFIRnYNzvea1V8A2LvAgOeJQZqFxPprClXWCKiPdHiQctNFcTU09DASVXVI8k7F9a8KkdIIYQnRXLN2K6k6X7FkaqjboNZixcTazDU2OxaLLL54NkLiEXe6wVGWkV1TvB45P+gdwDFddN+aOozzu/wHwZG9D/E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(54906003)(6486002)(36756003)(8676002)(26005)(38100700002)(66946007)(66476007)(66446008)(64756008)(31686004)(53546011)(76116006)(91956017)(66556008)(5660300002)(186003)(316002)(2906002)(4326008)(83380400001)(6506007)(82960400001)(86362001)(38070700005)(8936002)(6512007)(122000001)(110136005)(71200400001)(2616005)(508600001)(170073001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cndTWnhtUkpWVzJScWwra25rUFZ5cmRTcHNpZTZhYnBXZXZtaVNhQjhaNU9o?=
 =?utf-8?B?ODROVXFZRDZ4eXBnRlNpUDlDTGlUZSszb29hZHFaMWROaEdjSmc2akJKeDFR?=
 =?utf-8?B?UHR2c3grNmtETTQ4dGtnRWdwUWRHRFkvOFdrZlp1UUxGRHZNaHNNYTU2RVlN?=
 =?utf-8?B?c1B3YlpaSFprUlNxOVQveW5WR0RmZXRiY0JLc3U4NXN2cmpjL2FmakxDWitW?=
 =?utf-8?B?Z3hGeEtTMXMwekpOQVQrT2tBUUtBZkdubDJQd1BXdEQ1bXN4em5qcG4zUVQ3?=
 =?utf-8?B?N2xJaXQvRkJFclduVDFhRVEvdm81Vmp6VXBhR1FCMUpxSGM0c1kwRWhNMlBm?=
 =?utf-8?B?OURoUHpkSlVWZ3hpT2RXU2J4ai9BOCtSbVAyMVkzdnVpSEhrbDh0YmF5dTlT?=
 =?utf-8?B?R2N6RXZjenZQWkFhblV4cWRCUWhRTEJWY2FoYTlmc3RGMUtJcFh1NE40RHE0?=
 =?utf-8?B?eWRHWXcxd1ZPZ0V0aVZUbm1jSGxVY0VNd1FVNDd5Wll2Z09ZQW1xdW5zYTNL?=
 =?utf-8?B?akZWY3UzTTFZMmZ0NmxuSk9ZckNwR0lFZjJrc1h2YXc3TnhuTUJmLzRGZytu?=
 =?utf-8?B?RVdFSGRBWXpNSHZGTTlCMHhqcHZNSFNTckNhUnBEOTh2L1ZrVi9IMUFVOGVV?=
 =?utf-8?B?MTFQOE45SHZXNElJMHRoKzNxRlU3Zmo1dXQrYW91M2tTV2hZNjlaU3dtbFlT?=
 =?utf-8?B?OUJtcTJwckZzRCsvTkY3S2FJNGtOL25oUUFtTXhZUDNXZHRtSzMvN0Q4aW5r?=
 =?utf-8?B?UmVSc2ZnektFbjRaUEZYQUF2V1FwWlFHTWNRYVRzYlRKQWR1VXdsV20rUUhr?=
 =?utf-8?B?WlhQaDR2L3ViNVRYSFFFZVFXak9SNXU3QWxEcjFoblNQMXVFeHhOSFRkclhi?=
 =?utf-8?B?eTlDbnRxeWtycVFDc2xJVnYybWNtZWdMaVVzQnFxU0QwNyt1M3RUTVdVNmlq?=
 =?utf-8?B?MVg4S0pSdUJ1WkZMQUJoYVV1VFdKclg5aWoxWnJvOUhNWDQ3a0tzVTBtVHVS?=
 =?utf-8?B?MzhUUnhuVWFOVU1aTE4vd0M2RlM0QkZLd3VPNEFSM3F3WEsvRXhvbDR4a1FG?=
 =?utf-8?B?ZCs2ZjNld1ZSS3lSR3lWa3VmMGgrU3lVanIycDQvMWo5ODVwbzZ3RUNhbHBp?=
 =?utf-8?B?Q2ZjRFd4Qkh3R25udVhpME5QYnlBbk5XVUNaclVRNWI1ODc5U2tIYjVaZjA2?=
 =?utf-8?B?SFlnY1UwTmZka1BHTEIwWi9EN2xQbTFlK1prUDR1VGRudGgxVUZTRGJMcmxp?=
 =?utf-8?B?TU1FMnBMSThveWxnQ3BqbkVEd1VYM1FlQzVsZHBCMy9WY0paWVpYSlkyRFdR?=
 =?utf-8?B?L0xyYmhMWWtYS2x4YStyTXo1T1RUajk2RlFhRnN3MlUzQVZFRFhHV0laWlc0?=
 =?utf-8?B?OHhHbThGOHpCK0dydFdrNVVZZHZiUzd3c2RiUCtlV09tcFpqVlZUY0FMSkY4?=
 =?utf-8?B?MnlXdGtFTUJwaDh3TDJTckhkcFMwUG55cjJaTmN4LzlaSC8wREV6Z0M5dWda?=
 =?utf-8?B?QnJQY0x6bDU1L241OTNsMXpWTStOeHIyT0hpNE9LL0pPZi9PUHMwZzNLVkhq?=
 =?utf-8?B?dWQxZ0RmRWlPdzVqVHdoT1FMamxNQXpmakdpOGlsNkFFOWwxSjJlM21qNmJx?=
 =?utf-8?B?NWtRdnJCcFZTazNIVjFHRkpkdmEvbWtsSXJ6bGNPdXhVME1pbVhDNHU3aXRj?=
 =?utf-8?B?Sk9IZFRnNU5DNktJS0tLR3Jhc1JJVll2bTljazgzWlcxNlQ4VjFuTFhlczcx?=
 =?utf-8?B?ajAvSTIydEE2T01ZTWtQTkZETGVjQkk4bjNQbWlnMnNBeS8yM3B0NmYwU3Nk?=
 =?utf-8?B?SzhLb0tld0J4QmpXK0N5K2p5bTYxT29PMVpRSjJ1S1ArTHVpaUNneENEeUgr?=
 =?utf-8?B?TlRBL1hkSkQ3UnlHT1BESXNEMWhoSTZvZzlFeGQ1Y3czYVR6SkJYbVRjeFNO?=
 =?utf-8?B?azkwL2lNSWYybnoxaWVxZE0xMms1bmNYdXlmbjBDNTFNL2JiU0RDcUdiQlFV?=
 =?utf-8?B?ODhoK1hUR095Uy9mc2dUTy9XT1VuTnhGOXk5bDBmRE1zWkV5SXZ5TmorWFNQ?=
 =?utf-8?B?ZVFOUjVCd1RpVGh2QlNTaUlMQW54ZzAzYlJuYmdBNEdyVWF1a294NjF2R2Zn?=
 =?utf-8?B?QW1SS2l4L1hwUlRUS2ttblU4a29WQjNFdXA5Y2ovemZVL2cxS3phdzJTR3Fs?=
 =?utf-8?B?NUZaMDE2SEROQURDdWJWWGlsZXhqeUFjMGRpNjQ3ZThWWG5yMkpJaUhSc1dm?=
 =?utf-8?B?Vis4K1RBNWdodU9vTXorWVh5YWdQRXJJaGZ2c00zTmpRVkRFdWZlbW4yWHFT?=
 =?utf-8?B?SXhtVEY2TmxHUHZOdGw1cUFLc0RTZVBEdEdHRGJCdXBxSVBZWDJzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB9D746036A3EE43BF7DAD455F08631A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060d9c4a-90c0-47db-d9d2-08da34d259a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 11:18:47.7957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcSL0/2z9FWFVKG/M2fi4/i1kO6jZ6vRUwvEVo39qXENa37yz0/5ohJNo85cq9j44yY6thjj+3UR2itLG0vp0NW2LQeNlXpVPfOoCH1RKvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4071

T24gMTMvMDUvMjAyMiAxMTozNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBTb21lIENQVSBt
b2RlbHMgZG9uJ3QgZXhoaWJpdCBNQ0RUIGJlaGF2aW9yLCBidXQgYWxzbyBkb24ndCBleHBvc2UN
Cj4gTUNEVF9OTy4gIFNldCB0aGUgTUNEVF9OTyBiaXQgZm9yIENQVXMga25vd24gdG8gbm90IGV4
aGliaXQgdGhlDQo+IGJlaGF2aW9yLCBzbyBndWVzdHMgY2FuIGdldCB0aGlzIGluZm9ybWF0aW9u
LCBhcyB1c2luZw0KPiBmYW1pbHkvbW9kZWwvc3RlcHBpbmcgZGV0ZWN0aW9uIHdoZW4gcnVubmlu
ZyB2aXJ0dWFsaXplZCBpcyBub3QgdG8gYmUNCj4gcmVsaWVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICB4ZW4v
YXJjaC94ODYvY3B1L2ludGVsLmMgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICB4ZW4vYXJjaC94ODYvY3B1aWQuYyAgICAgfCAxMCArKysrKysNCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2NwdS9pbnRlbC5jIGIveGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jDQo+IGluZGV4IGRj
NmEwYzc4MDcuLmQ4MjFmNDYwYWUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvaW50
ZWwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMNCj4gQEAgLTUxOCw2ICs1MTgs
NzMgQEAgc3RhdGljIHZvaWQgaW50ZWxfbG9nX2ZyZXEoY29uc3Qgc3RydWN0IGNwdWluZm9feDg2
ICpjKQ0KPiAgICAgIHByaW50aygiJXUgTUh6XG4iLCAoZmFjdG9yICogbWF4X3JhdGlvICsgNTAp
IC8gMTAwKTsNCj4gIH0NCj4gIA0KPiArdm9pZCB1cGRhdGVfbWNkdF9ubyhzdHJ1Y3QgY3B1aW5m
b194ODYgKmMpDQo+ICt7DQo+ICsjZGVmaW5lIEZBTTZfTU9ERUwobSwgcywgYykgeyA2LCBtLCBz
LCBjIH0NCj4gKyAgICAvKg0KPiArICAgICAqIExpc3Qgb2YgbW9kZWxzIHRoYXQgZG8gbm90IGV4
aGliaXQgTUNEVCBiZWhhdmlvciwgYnV0IG1pZ2h0IG5vdA0KPiArICAgICAqIGFkdmVydGlzZSBN
Q0RUX05PIG9uIENQVUlELg0KPiArICAgICAqLw0KPiArICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ew0KPiArICAgICAgICB1aW50OF90IGZhbWlseTsNCj4gKyAgICAgICAgdWludDhfdCBtb2RlbDsN
Cj4gKyAgICAgICAgdWludDhfdCBzdGVwcGluZzsNCj4gKyAgICAgICAgYm9vbCBjaGVja19zdGVw
cGluZzsNCj4gKyAgICB9IG1jZHRfbm9bXSA9IHsNCj4gKyAgICAgICAgLyogSGFzd2VsbCBTZXJ2
ZXIgRVAsIEVQNFMuICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHgzZiwgMiwgdHJ1ZSksDQo+
ICsgICAgICAgIC8qIEVsa2hhcnQgTGFrZS4gKi8NCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDNm
LCA0LCB0cnVlKSwNCj4gKyAgICAgICAgLyogQ2hlcnJ5dmlldy4gKi8NCj4gKyAgICAgICAgRkFN
Nl9NT0RFTCgweDRjLCAwLCBmYWxzZSksDQo+ICsgICAgICAgIC8qIEJyb2Fkd2VsbCBTZXJ2ZXIg
RSwgRVAsIEVQNFMsIEVYLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4NGYsIDAsIGZhbHNl
KSwNCj4gKyAgICAgICAgLyogQnJvYWR3ZWxsIERFIFYyLCBWMy4gKi8NCj4gKyAgICAgICAgRkFN
Nl9NT0RFTCgweDU2LCAzLCB0cnVlKSwNCj4gKyAgICAgICAgLyogQnJvYWR3ZWxsIERFIFkwLiAq
Lw0KPiArICAgICAgICBGQU02X01PREVMKDB4NTYsIDQsIHRydWUpLA0KPiArICAgICAgICAvKiBC
cm9hZHdlbGwgREUgQTEsIEhld2l0dCBMYWtlLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4
NTYsIDUsIHRydWUpLA0KPiArICAgICAgICAvKiBBbm5pZWRhbGUuICovDQo+ICsgICAgICAgIEZB
TTZfTU9ERUwoMHg1YSwgMCwgZmFsc2UpLA0KPiArICAgICAgICAvKiBBcG9sbG8gTGFrZS4gKi8N
Cj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDVjLCA5LCB0cnVlKSwNCj4gKyAgICAgICAgRkFNNl9N
T0RFTCgweDVjLCAweGEsIHRydWUpLA0KPiArICAgICAgICAvKiBEZW52ZXJ0b24uICovDQo+ICsg
ICAgICAgIEZBTTZfTU9ERUwoMHg1ZiwgMSwgdHJ1ZSksDQo+ICsgICAgICAgIC8qIFhNTTcyNzIu
ICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHg2NSwgMCwgZmFsc2UpLA0KPiArICAgICAgICAv
KiBDb3VnYXIgTW91bnRhaW4uICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHg2ZSwgMCwgZmFs
c2UpLA0KPiArICAgICAgICAvKiBCdXR0ZXIuICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHg3
NSwgMCwgZmFsc2UpLA0KPiArICAgICAgICAvKiBHZW1pbmkgTGFrZS4gKi8NCj4gKyAgICAgICAg
RkFNNl9NT0RFTCgweDdhLCAxLCB0cnVlKSwNCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDdhLCA4
LCB0cnVlKSwNCj4gKyAgICAgICAgLyogU25vd3JpZGdlLiAqLw0KPiArICAgICAgICBGQU02X01P
REVMKDB4ODYsIDQsIHRydWUpLA0KPiArICAgICAgICBGQU02X01PREVMKDB4ODYsIDUsIHRydWUp
LA0KPiArICAgICAgICBGQU02X01PREVMKDB4ODYsIDcsIHRydWUpLA0KPiArICAgICAgICAvKiBM
YWtlZmllbGQgQi1zdGVwLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4OGEsIDEsIHRydWUp
LA0KPiArICAgICAgICAvKiBFbGtoYXJ0IExha2UuICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwo
MHg5NiwgMSwgdHJ1ZSksDQo+ICsgICAgICAgIC8qIEphc3BlciBMYWtlLiAqLw0KPiArICAgICAg
ICBGQU02X01PREVMKDB4OWMsIDAsIHRydWUpLA0KPiArICAgICAgICB7IH0NCj4gKyAgICB9Ow0K
PiArI3VuZGVmIEZBTTZfTU9ERUwNCj4gKyAgICBjb25zdCB0eXBlb2YobWNkdF9ub1swXSkgKm07
DQo+ICsNCj4gKyAgICBmb3IgKG0gPSBtY2R0X25vOyBtLT5mYW1pbHkgfCBtLT5tb2RlbCB8IG0t
PnN0ZXBwaW5nOyBtKyspDQo+ICsgICAgICAgIGlmICggYy0+eDg2ID09IG0tPmZhbWlseSAmJiBj
LT54ODZfbW9kZWwgPT0gbS0+bW9kZWwgJiYNCj4gKyAgICAgICAgICAgICAoIW0tPmNoZWNrX3N0
ZXBwaW5nIHx8IGMtPng4Nl9tYXNrID09IG0tPnN0ZXBwaW5nKSApDQo+ICsgICAgICAgIHsNCj4g
KyAgICAgICAgICAgIF9fc2V0X2JpdChYODZfRkVBVFVSRV9NQ0RUX05PLCBjLT54ODZfY2FwYWJp
bGl0eSk7DQo+ICsgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgfQ0KPiArfQ0KDQpQbGVh
c2UgY291bGQgd2Ugc2VlIGFib3V0IHVzaW5nIHg4Nl9tYXRjaF9jcHUoKSByYXRoZXIgdGhhbiBi
YXNpY2FsbHkNCm9wZW5jb2RpbmcgaXQ/wqAgTGludXgncyBidWcuYyBoYXMgc29tZSBmYWlybHkg
Y29tcHJlaGVuc2l2ZSBleGFtcGxlcyBvZg0KaG93IHRvIGRvIHRhYmxlcyBsaWtlIHRoaXMgd2l0
aCBpdC4NCg0KQWxzbywgY2FuIHdlIHVzZSBvdXIgc2hpbnkgbmV3IGludGVsLWZhbWlseS5oIG5h
bWVzPw0KDQpUaGUgc3RlcHBpbmcgY2hlY2tzIGd1aWRhbmNlIHNlZW1zIHN1c3BlY3QuwqAgTGVt
bWUgcGluZyBzb21lIHBlb3BsZQ0KYWJvdXQgdGhhdC7CoCBJIHN1c3BlY3QgdGhhdCBtZWFucyAi
d2UgY2hlY2tlZCB0aGUgcHJvZHVjdGlvbiBDUFVzIGJ1dA0KZGlkbid0IGxvb2sgYXQgdGhlIHBy
ZS1wcm9kIGhhcmR3YXJlIiB3aGljaCBpbiBwcmFjdGljZSBtZWFucyB3ZSBkb24ndA0KY2FyZSBh
Ym91dCBzdGVwcGluZ3MgbGlzdGVkLg0KDQp+QW5kcmV3DQo=

