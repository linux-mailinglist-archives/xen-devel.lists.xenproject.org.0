Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF12628B73
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 22:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443578.698195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouhBR-0003Ey-NV; Mon, 14 Nov 2022 21:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443578.698195; Mon, 14 Nov 2022 21:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouhBR-0003Cv-Jl; Mon, 14 Nov 2022 21:40:01 +0000
Received: by outflank-mailman (input) for mailman id 443578;
 Mon, 14 Nov 2022 21:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ip0=3O=citrix.com=prvs=31080188b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ouhBQ-0003Cp-92
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 21:40:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d3562f-6464-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 22:39:57 +0100 (CET)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 16:39:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5768.namprd03.prod.outlook.com (2603:10b6:510:43::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 21:39:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 21:39:50 +0000
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
X-Inumbo-ID: e0d3562f-6464-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668461997;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zq0RuLhePLvF8Xg/x4BQzr9TWL6VlQFUXzZ48ksxCro=;
  b=W/s+1l6nLqEJp2CbyHv9bHy6xlwXmXWwoPzmWMOaQStXUOLU7ip5AK9H
   kIoy62Ydt8xUdZcN4rXGwL1mO2REmX3/ahSCpzftl0vldKMygROhp6QM5
   aclkWw9g+H4gh48jHt7UuQfc96/ik2zigRyrrihnnfwnsvrHNWPRt/pwD
   A=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 84826916
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SYiUIK7dmjkLWTXN+c8jXAxRtN7GchMFZxGqfqrLsTDasY5as4F+v
 mZMCmHVP//bamv8ftAnPYnl805XsZ/Vy9ZqSwto/301Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 N0dChwWfjC6i+eQ5q2fWvhLlsYHM5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOaF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJOROfmp6c06LGV7kATIz8GSEODm9OWpX+FfeN5N
 mA95TV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf13rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEuZzhXgMzoALNUQqYAhhRYYekY8mk7Abd5PMZdIKBFADZ4
 j4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsIFcFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:w1oiAKg41OTHos0WpQ93eZVFJXBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="84826916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG0m/dRrG3WZo7S7cXrRkUwGLWuz/sT5k3WsvFvTR96h0TpDRk+B3APnSwKE7Q5ltvpCK04JFaaab8jYOeNO3gI6rLh/HuDMIH8SkCvUrPEvzpJV98KpT3a4TgZesBMTE6Ex3eAoxQM4QIKQwV+4BRsuHiL/XhnJQLE2twsUAwU4nrbUG89FEG9LBLKk0HuMZWYmo3uUcDf7oDrJJFkCJa0M2p/rdxsvwlCnPTLEq7XTfummrqxON91pcfS2U5lLS2AeU11wLrW4Kg4/EiG4SEt6yWzvc5+8iAxY0PXqE2kZglaLGbw+vQ/QUlzNqmncK1c9wfXSJnwwl+jJDTHpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zq0RuLhePLvF8Xg/x4BQzr9TWL6VlQFUXzZ48ksxCro=;
 b=V0zTV4Cedyj/FjaYHbrakkn1BLCi3oKmGuQ7cr5Oj3Qx6ANjtWzN5oJLFl3rH4LAIGp7Y8+SKd0T2NWSt1AD/WibyUdSkkRu3Ot5WPQK6xqMCRvksxskXQn+8n3uXTKtApnqEfeQAn3NOyHL6I+8et+g9Vx9TeD8dlexqsVoyuXqB0H8g3b+2kPm00GRWfBOXsipnkvt/31Qqkv87rREkvVPP6zoTua/vC5KH8ThpHOCfxRHXijC8snpqukOiYyGUCMr+LwxPSBcvPL6n2fh4xf2dV3y+FUNB8WpLtOlCDDgHQwAQrk6OeTGS3EqNUzhGWUBkQY9RptoPcZcFASMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zq0RuLhePLvF8Xg/x4BQzr9TWL6VlQFUXzZ48ksxCro=;
 b=AxEaoLnnhxu4NhDnqSsIhcYKP8DXW/jcRRJOVp5MmStOShmmBEpSUzJq9D8atARLaZaJVZWcrN8pNZ1aQ6YlH4HiGCHuYVMdTfFF+FDUTRvBldMsVUNl6p2D+OQ3cZk8GWRtObxijDIM5R5K58E8Viv78kxj9d+oXaa3V/cU29U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Topic: [PATCH for-4.17 v3 1/2] amd/virt_ssbd: set SSBD at vCPU context
 switch
Thread-Index: AQHY76YmBe8QNIQ1KUWqToJPwoQsT64/A/IA
Date: Mon, 14 Nov 2022 21:39:50 +0000
Message-ID: <544896d4-f9af-a4f9-cdcb-217d27ee94c3@citrix.com>
References: <20221103170244.29270-1-roger.pau@citrix.com>
 <20221103170244.29270-2-roger.pau@citrix.com>
In-Reply-To: <20221103170244.29270-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5768:EE_
x-ms-office365-filtering-correlation-id: a9a99d49-046b-4869-053e-08dac688c293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jaFUjR+I3oMo2HnNhoMNFqbm/3JTKW/HmrWeDRYdzXuvda20jF30zjS9cDmFx/E2ErRjfzM3zSSz+MZgnSVmgJV9UHmZi78976Yxt7A2JmxfqYNsdAa8bJkozNIzQ2L+mTMCSnpQ8H5t9zocih3NIR/yOf2fptF4+/EwM7Dv4KH8P59+BZDSf+YGfJ0jdxypXxMDYYQxnRbgeDNVIzs1nTZUDcS+zumUwPyEdEZMUFkTX3H0UP1YTD65SlV28LQlrtOzePvrfdsMP+1xrlLtAdkMp9JLBqNTYpOwzKOwxqtpXNQNmIl9FAJPWe9OSP5yKVQ4m5sS7A+PwMM/ffXNIUduiNlzvAOnWIOQg92i52Zm/CU6t0o9HLaIKaa3suy7PcfE+LYbsxfmEV1jLamFt/5nYf55jVSx+CKPRtns59XI3uqT3a+rcYOOHFyeKy+Rrj63J9OJ/0DQa3Ws/8VjGqkOuhIbL8Xfbmd2GpcKY2E6qksh7gTtKR3iaMRx9NyBLi8mOHxBR8R3VjoVBXg14Kd02QT2Xurhn35KStq+o/KUBq08epvZJmkYAmkDq1XJ7pP7Fh/zmm2lm4J04XIU0frQS7RtCY6HwGxW7BpRYdfCJLuH+7BN8c/ida25eUeRR/1Y8vnIkLNxMXUDHf3Z4Il2+dLDRLgPeNA95QbFr6r4L1HFWpJoVQXriNd0ulA39iEcWDXZfobWRr4gYWw6ESfNXmj+D13zB5elBOwZH2WKlPBgCciex1nPrEFfqMuZrvQoTtJCMOc4rhXX5jML4BgOEN2FhncmDeCOuODt1pAOIl+SKPeZmkVl86b2OF3knQ62+gembqF6aK6lcmAGlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(2906002)(4326008)(76116006)(6512007)(66946007)(8676002)(64756008)(66476007)(26005)(91956017)(316002)(66556008)(66446008)(53546011)(186003)(8936002)(41300700001)(6506007)(2616005)(36756003)(38100700002)(31696002)(82960400001)(86362001)(122000001)(38070700005)(83380400001)(5660300002)(71200400001)(478600001)(6486002)(31686004)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGFFUXlBNmNta2c5cUdHOG5XWVRWc0tXelV3eVBOMW8vdzdaS2FjZjdYb0ti?=
 =?utf-8?B?cXdhUDVWQjg3blpaOXN3ZG93c3QyMUduaVZzdy9LMVFyZ1pZSkhUK0QyNWVV?=
 =?utf-8?B?cWc4amRsejQ2NFM1S1BNczF4dUxFZHo2Q2g4MGMzME1mdHVnWnJZRXM5UkFB?=
 =?utf-8?B?TmV1bmh5SFg5a1ovUFd2R1RHblRFdkNNMGVmU2Q4V21xcHgxTGY0T01oZWU1?=
 =?utf-8?B?ZjRPdGdCaU9QRGt5azVVYjZCZkx0MDZXMWRDOVVYazFGU2ptS05iNmFpbVN1?=
 =?utf-8?B?SGFLQTc5QW5wV1ZlZ3g3NmgwUkNMV2JNZGpKTVdEM29BOEE1cTRPaWtzTjdp?=
 =?utf-8?B?RVdwZGovT1ZlVVRVQ3B1SHdxMENtNFkrQlYzOU81SmtDRDI4T0pPRkc3YmY0?=
 =?utf-8?B?K3lVZDhaN2FKYmhpZDFIWU5MMkZuVEZEeGdFUStSK0YvMDBsNWs5RkZwUjds?=
 =?utf-8?B?d1k4OU9xY1ljWTg2b25GaVJOMVp1bVVaM3RJRy9kWWpnRjZaMCtrZmhmMnFG?=
 =?utf-8?B?R1hrczJhWGdvc25kVjlsbHNqaFMwR25uS2g3RVVmSWYrMWl4SXgrcG96NmZD?=
 =?utf-8?B?cUt3dGEyQ0pqVFUvSXYrc3RScEx0WEwrbHREMnVZOU1jT2FyWTRzbmtITFo1?=
 =?utf-8?B?NnNTTTdIRnJ0OG9NWmN3SEtPSDF0QVpJMnRuNzVKRjJkTU9xdkIwZnN0cUhO?=
 =?utf-8?B?bFFaY245MUVaVml2RDRBUUcyaS95SjJFK1VGcGZIL0NJc1Izdm5Ud2QrbnhZ?=
 =?utf-8?B?NzUvMjRlSGFhVGkranZHdUpFUmRwUFFWRlU2RkJWWDJBNjJvUmNCS2tzQmpY?=
 =?utf-8?B?bjRxakJkSkJvQWg2VTVhWGlGQVMrM0tlMkx6cDR0Tk8yWnNHczhyalE0NXZr?=
 =?utf-8?B?SDY3dGdqZ0gyb1Zlbk1aeEJxUHZyMEdTK0FxTmwrL2h2M1IrZ0NxVEJ3Mkhy?=
 =?utf-8?B?d2RUM0JIVmVBeVBwZ09qSUdjMnpVMmNIU1hIM28rbEgxUGI2MnVaS1hkLy9P?=
 =?utf-8?B?R3F2Y2Y5T2hqbzJtNGZQTCttb3RoOXluSGl5a1pBcEY1RW8waEI2SGVucmlV?=
 =?utf-8?B?a21ab1Q0VnVNL3JNRUp3c2hLMnhTLzlEb3NhWWJOYTZUUmJuNHpyVWJ4Y3Yx?=
 =?utf-8?B?WlFtU1RkL0FKUFd3a2pKa0crdVNqN1d2M29hekdSQUVrc3c2UzVUcGdEcW1J?=
 =?utf-8?B?enQ2cm1HQmFIL21NYXBya0JFa3I4U1dWUnFVV2liQ08wLzBoVE91elZKNEN4?=
 =?utf-8?B?a3JNTWxoTjBlNjExNldmemVrbEx4dGhac3pLbDdKd3E5Y0dQKzZxaGRycFQ2?=
 =?utf-8?B?WC9XSktDbW51RXdzQnpET2wwb0pPOHZuUGJpOVNsajdnNlpxK3lBUDhlbks5?=
 =?utf-8?B?UGR1ck81S1dxZXMrNU4rVzFzR09YWHZ6VlhTREhPMHBYWUVBWEpNRlBsMi93?=
 =?utf-8?B?R2hYT21QeXlMTVRNRG9vMDZUQlR6ZjZQbWF2bFdDMjJ0YmZCc0NhY2Rjbmpj?=
 =?utf-8?B?VjBPV2J6aVFOOUdYNURWdmRHc3psNVNvNlBacldpRU1FK3lZdjladThLOGNL?=
 =?utf-8?B?L0M2c0FqNG92dzZXWFJDVVJIOFpFMzRiRVNIYkljTlpTbzBGd00zQytUbXFy?=
 =?utf-8?B?VzBlVFNxVERaNjdaQ2lOYjU5Z0QxSHNNZDdQV3lLcUpwdXg2YXdCdEM1ODY1?=
 =?utf-8?B?ZWF5d1ZUVm9zMHlPaytoZ3M3bUVHMWZvNUp2cVpiRHpRQmxIcGtkc3FVeitt?=
 =?utf-8?B?cno5UEJrdWgzR0hzaHhHbGRuc1VCZmp4S3hWY0FtaTRDU1lpei95REdNOUxs?=
 =?utf-8?B?VVczMFBNK2N0SFhsWVFHSGtzZFpBWFhmRkFrWTdVcDRHK2NXKzZJVFZGMUl4?=
 =?utf-8?B?MXFwZFBqS1liRXVJNnFNd3Y5Sm43OTVaeCs5QzNNcFF0d0NhY2cyU0JUVTY1?=
 =?utf-8?B?OUx4dVZlUmpLUUszWXhWN3FDTkw3UVNkNS96cndzTU5NTERDVEJKOGtnUk1D?=
 =?utf-8?B?bVdJR254bzIwMTVsUmhjbmo1VFRSZEtHS05VSjIvTlYyYzk4Z0FzdTBGayts?=
 =?utf-8?B?OGUvOW5CeEYxR0ZIeHdXNWIxcG1OR0RBeGR3ZDNxRHBPWXNBbEhvcC9qcy9E?=
 =?utf-8?Q?MYzFKVd1vSkr8XVb7n+rPk8lT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B3656C28E7B45408D11762B49D919AA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TPoSuf5QKzuDCDSbIRptpv1knAb9Leb3rI8nzLT5HCsn6ccSHxpVBeVYONJxQYKTO4fQzawjkXl93tSinqLOr2B0qiXnSqcyW/Qs/UOLn41jWxhKjMgZm6P9CeXru44ctIGovxHBLOiSWmynDY0i/ESe53euO8PGHYYPGfBldgeCNp5uCRsp7xWFegQV0YiHSZvXSF1F6HiyIck+U5EpgCQQQenhnCE3l6YceqQ/l5VWSbsLTkPe5GH32oddnYvl5hpNuLyuBLd2xA8ejfR4G0GEdPBF9f/UEqC9MVqd7nQMpOr1nNl4ofJuGub6Qyx7NflhMwJ27YRmcr0rozbQOzv/FPP9LDxxamFbfFXMKTqZYaHn9U3/kVNkHACbXe2t9HoLmdL9UjWir0DY97OHzJgrk2J229MC6A+Eo6FnrydAItWD2sqqdVkQ6k8sHIJCn2/RKeh0WA/WqVZSXAtVZXkGz5LY3aV6cCoKp70j8q60jPy4Qk7l7FCu1UXR3e84yvatmOsctrt3Bz5YSbkjEU8MR6QT/7YVoLZnx6voA4rzILjn3mnEGWCkSo02L02bGJhEji1r6EdXC8eMkXsYBxHmdjG3Veooc747ieuI2VJy7OsrxozULAWEQehUA8VzGkGOHMjpLZ1GAcOkBIkKXGpkX67iE8voTC7sqHOberdV4Sp31iVWiT8pEgeRCbTmQh3DTaS3k5cKTxu/whFxdqW2IovYWloaaj9J6Py9ro8kvF2MJ89KshYC1u4Ae5pvjjiv2Wpj6ZwNtQgovdwkajJBTa7MXvYwhta6xXeEyb29ybV0cDxoZ1ukqMV+vPuj1PBLVrjVELlg7JVSAeuNxxofFlRQbbsK2pK+/APTPYh0J5VGNtQEI4nmHGq+LA8zbVLLGb2YpmmO/o72MXsm8g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a99d49-046b-4869-053e-08dac688c293
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 21:39:50.8300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Qqe2Pdm3n7uiaJzQOkSpm8p/pjnnwtQdF237WpEmWRFJgEFsxxL6o43JxojImoe8b3qq8DvoJXtdFngabWs8xXFg2+OcpY2N/b7SeauJyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5768

T24gMDMvMTEvMjAyMiAxNzowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGUgY3VycmVu
dCBsb2dpYyBmb3IgQU1EIFNTQkQgY29udGV4dCBzd2l0Y2hlcyBpdCBvbiBldmVyeQ0KPiB2bXtl
bnRyeSxleGl0fSBpZiB0aGUgWGVuIGFuZCBndWVzdCBzZWxlY3Rpb25zIGRvbid0IG1hdGNoLiAg
VGhpcyBpcw0KPiBleHBlbnNpdmUgd2hlbiBub3QgdXNpbmcgU1BFQ19DVFJMLCBhbmQgaGVuY2Ug
c2hvdWxkIGJlIGF2b2lkZWQgYXMNCj4gbXVjaCBhcyBwb3NzaWJsZS4NCj4NCj4gV2hlbiBTU0JE
IGlzIG5vdCBiZWluZyBzZXQgZnJvbSBTUEVDX0NUUkwgb24gQU1EIGRvbid0IGNvbnRleHQgc3dp
dGNoDQo+IGF0IHZte2VudHJ5LGV4aXR9IGFuZCBpbnN0ZWFkIG9ubHkgY29udGV4dCBzd2l0Y2gg
U1NCRCB3aGVuIHN3aXRjaGluZw0KPiB2Q1BVcy4gIFRoaXMgaGFzIHRoZSBzaWRlIGVmZmVjdCBv
ZiBydW5uaW5nIFhlbiBjb2RlIHdpdGggdGhlIGd1ZXN0DQo+IHNlbGVjdGlvbiBvZiBTU0JELCB0
aGUgZG9jdW1lbnRhdGlvbiBpcyB1cGRhdGVkIHRvIG5vdGUgdGhpcyBiZWhhdmlvci4NCj4gQWxz
byBub3RlIHRoYXQgdGhlbiB3aGVuIGBzc2JkYCBpcyBzZWxlY3RlZCBvbiB0aGUgY29tbWFuZCBs
aW5lIGd1ZXN0DQo+IFNTQkQgc2VsZWN0aW9uIHdpbGwgbm90IGhhdmUgYW4gZWZmZWN0LCBhbmQg
dGhlIGh5cGVydmlzb3Igd2lsbCBydW4NCj4gd2l0aCBTU0JEIHVuY29uZGl0aW9uYWxseSBlbmFi
bGVkIHdoZW4gbm90IHVzaW5nIFNQRUNfQ1RSTCBpdHNlbGYuDQo+DQo+IFRoaXMgZml4ZXMgYW4g
aXNzdWUgd2l0aCBydW5uaW5nIEMgY29kZSBpbiBhIEdJRj0wIHJlZ2lvbiwgdGhhdCdzDQo+IHBy
b2JsZW1hdGljIHdoZW4gdXNpbmcgVUJTQU4gb3Igb3RoZXIgaW5zdHJ1bWVudGF0aW9uIHRlY2hu
aXF1ZXMuDQoNClRoaXMgcGFyYWdyYXBoIG5lZWRzIHRvIGJlIGF0IHRoZSB0b3AsIGJlY2F1c2Ug
aXQncyB0aGUgcmVhc29uIHdoeSB0aGlzDQppcyBhIGJsb2NrZXIgYnVnIGZvciA0LjE3LsKgIEV2
ZXJ5dGhpbmcgZWxzZSBpcyBkaXNjdXNzaW5nIHdoeSB3ZSB0YWtlDQp0aGUgYXBwcm9hY2ggd2Ug
dGFrZS4NCg0KKGFuZCB0byBiZSBjbGVhciwgaXQncyBzbG93IGV2ZW4gd2l0aCBNU1JfU1BFQ19D
VFJMLsKgIEl0J3MganVzdCB0aGF0IGl0cw0KYSB3aG9sZSBsb3QgbGVzcyBzbG93IHRoYW4gd2l0
aCB0aGUgTFNfQ0ZHIE1TUi4pDQoNCj4NCj4gQXMgYSByZXN1bHQgb2Ygbm8gbG9uZ2VyIHJ1bm5p
bmcgdGhlIGNvZGUgdG8gc2V0IFNTQkQgaW4gYSBHSUY9MA0KPiByZWdpb24gdGhlIGxvY2tpbmcg
b2YgYW1kX3NldF9sZWdhY3lfc3NiZCgpIGNhbiBiZSBkb25lIHVzaW5nIG5vcm1hbA0KPiBzcGlu
bG9ja3MsIGFuZCBzb21lIG1vcmUgY2hlY2tzIGNhbiBiZSBhZGRlZCB0byBhc3N1cmUgaXQgd29y
a3MgYXMNCj4gaW50ZW5kZWQuDQo+DQo+IEZpbmFsbHkgaXQncyBhbHNvIHdvcnRoIG5vdGljaW5n
IHRoYXQgc2luY2UgdGhlIGd1ZXN0IFNTQkQgc2VsZWN0aW9uDQo+IGlzIG5vIGxvbmdlciBzZXQg
b24gdm1lbnRyeSB0aGUgVklSVF9TUEVDX01TUiBoYW5kbGluZyBuZWVkcyB0bw0KPiBwcm9wYWdh
dGUgdGhlIHZhbHVlIHRvIHRoZSBoYXJkd2FyZSBhcyBwYXJ0IG9mIGhhbmRsaW5nIHRoZSB3cm1z
ci4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAgLSBGaXggY2FsbGluZyBzZXRf
cmVnIHVuY29uZGl0aW9uYWxseS4NCj4gIC0gRml4IGNvbW1lbnQuDQo+ICAtIENhbGwgYW1kX3Nl
dF9zc2JkKCkgZnJvbSBndWVzdF93cm1zcigpLg0KPg0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAg
LSBKdXN0IGNoZWNrIHZpcnRfc3BlY19jdHJsIHZhbHVlICE9IDAgb24gY29udGV4dCBzd2l0Y2gu
DQo+ICAtIFJlbW92ZSBzdHJheSBhc20gbmV3bGluZS4NCj4gIC0gVXNlIHZhbCBpbiBzdm1fc2V0
X3JlZygpLg0KPiAgLSBGaXggc3R5bGUgaW4gYW1kLmMuDQo+ICAtIERvIG5vdCBjbGVhciBzc2Jk
DQo+IC0tLQ0KPiAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgMTAgKysrLS0t
DQo+ICB4ZW4vYXJjaC94ODYvY3B1L2FtZC5jICAgICAgICAgICAgfCA1NSArKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRyeS5TICAgICAg
fCAgNiAtLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgfCA0NSArKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYW1kLmgg
ICAgfCAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L21zci5jICAgICAgICAgICAgICAgIHwgIDkgKysr
KysNCg0KTmVlZCB0byBwYXRjaCBtc3IuaCBub3cgdGhhdCB0aGUgc2VtYW50aWNzIG9mIHZpcnRf
c3BlY19jdHJsIGhhdmUgY2hhbmdlZC4NCg0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Y3B1L2FtZC5jIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KPiBpbmRleCA5OGM1MmQwNjg2Li4w
NWQ3MmM2NTAxIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMNCj4gPHNuaXA+DQo+ICt2b2lkIGFtZF9zZXRfc3NiZChi
b29sIGVuYWJsZSkNCj4gK3sNCj4gKwlpZiAob3B0X3NzYmQpDQo+ICsJCS8qDQo+ICsJCSAqIEln
bm9yZSBhdHRlbXB0cyB0byB0dXJuIG9mZiBTU0JELCBpdCdzIGhhcmRjb2RlZCBvbiB0aGUNCj4g
KwkJICogY29tbWFuZCBsaW5lLg0KPiArCQkgKi8NCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJaWYg
KGNwdV9oYXNfdmlydF9zc2JkKQ0KPiArCQl3cm1zcihNU1JfVklSVF9TUEVDX0NUUkwsIGVuYWJs
ZSA/IFNQRUNfQ1RSTF9TU0JEIDogMCwgMCk7DQo+ICsJZWxzZSBpZiAoYW1kX2xlZ2FjeV9zc2Jk
KQ0KPiArCQljb3JlX3NldF9sZWdhY3lfc3NiZChlbmFibGUpOw0KPiArCWVsc2UNCj4gKwkJQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7DQoNClRoaXMgYXNzZXJ0IGlzIHJlYWNoYWJsZSBvbiBGYW0xNCBh
bmQgb2xkZXIsIEkgdGhpbmsuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3Zt
L3N2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4gaW5kZXggMWFlYWFiY2IxMy4u
OGIxMDFkNGYyNyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4gQEAgLTk3Myw2ICs5NzMsMTYgQEAg
c3RhdGljIHZvaWQgY2ZfY2hlY2sgc3ZtX2N0eHRfc3dpdGNoX2Zyb20oc3RydWN0IHZjcHUgKnYp
DQo+ICANCj4gICAgICAvKiBSZXN1bWUgdXNlIG9mIElTVHMgbm93IHRoYXQgdGhlIGhvc3QgVFIg
aXMgcmVpbnN0YXRlZC4gKi8NCj4gICAgICBlbmFibGVfZWFjaF9pc3QoaWR0X3RhYmxlc1tjcHVd
KTsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogQ2xlYXIgcHJldmlvdXMgZ3Vlc3Qgc2VsZWN0
aW9uIG9mIFNTQkQgaWYgc2V0LiAgTm90ZSB0aGF0IFNQRUNfQ1RSTC5TU0JEDQo+ICsgICAgICog
aXMgYWxyZWFkeSBjbGVhcmVkIGJ5IHN2bV92bWV4aXRfc3BlY19jdHJsLg0KPiArICAgICAqLw0K
PiArICAgIGlmICggdi0+YXJjaC5tc3JzLT52aXJ0X3NwZWNfY3RybC5yYXcgJiBTUEVDX0NUUkxf
U1NCRCApDQo+ICsgICAgew0KPiArICAgICAgICBBU1NFUlQodi0+ZG9tYWluLT5hcmNoLmNwdWlk
LT5leHRkLnZpcnRfc3NiZCk7DQo+ICsgICAgICAgIGFtZF9zZXRfc3NiZChmYWxzZSk7DQo+ICsg
ICAgfQ0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBjZl9jaGVjayBzdm1fY3R4dF9zd2l0Y2hf
dG8oc3RydWN0IHZjcHUgKnYpDQo+IEBAIC0xMDAwLDYgKzEwMTAsMTMgQEAgc3RhdGljIHZvaWQg
Y2ZfY2hlY2sgc3ZtX2N0eHRfc3dpdGNoX3RvKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgDQo+ICAgICAg
aWYgKCBjcHVfaGFzX21zcl90c2NfYXV4ICkNCj4gICAgICAgICAgd3Jtc3JfdHNjX2F1eCh2LT5h
cmNoLm1zcnMtPnRzY19hdXgpOw0KPiArDQo+ICsgICAgLyogTG9hZCBTU0JEIGlmIHNldCBieSB0
aGUgZ3Vlc3QuICovDQo+ICsgICAgaWYgKCB2LT5hcmNoLm1zcnMtPnZpcnRfc3BlY19jdHJsLnJh
dyAmIFNQRUNfQ1RSTF9TU0JEICkNCj4gKyAgICB7DQo+ICsgICAgICAgIEFTU0VSVCh2LT5kb21h
aW4tPmFyY2guY3B1aWQtPmV4dGQudmlydF9zc2JkKTsNCj4gKyAgICAgICAgYW1kX3NldF9zc2Jk
KHRydWUpOw0KPiArICAgIH0NCg0KV2hpbGUgdGhpcyBmdW5jdGlvbnMsIGl0J3Mgc3RpbGwgYSBw
ZXJmIHByb2JsZW0uwqAgWW91IG5vdyBmbGlwIHRoZSBiaXQNCnR3aWNlIHdoZW4gc3dpdGNoaW5n
IGJldHdlZW4gdmNwdXMgd2l0aCBsZWdhY3kgU1NCRC4NCg0KVGhpcyB3b3VsZG4ndCBiZSBzbyBi
YWQgaWYgeW91J2QgYWxzbyBmaXhlZCB0aGUgaW5uZXIgZnVuY3Rpb24gdG8gbm90IGRvDQphIHJl
YWQvbW9kaWZ5L3dyaXRlIG9uIHRoZSB2ZXJ5IHNsb3cgTVNSLCBiZWNhdXNlIHRoZW4gd2UnZCBv
bmx5IGJlDQp0b3VjaGluZyBpdCB0d2ljZSwgbm90IDQgdGltZXMuDQoNClRoaXMgaXNuJ3QgY3Jp
dGljYWwgdG8gZml4IGZvciA0LjE3LCBidXQgd2lsbCBuZWVkIGFkZHJlc3NpbmcgaW4gZHVlIGNv
dXJzZS4NCg0KSG93ZXZlciwgYXMgdGhlIHBhdGNoIGRvZXMgbmVlZCBhIHJlc3BpbiwgYW1kX3Nl
dF9zc2JkKCkgaXMgdG9vDQpnZW5lcmljLsKgIEl0J3MgcHJldmlvdXMgbmFtZSwgYW1kX3NldF9s
ZWdhY3lfc3NiZCgpLCB3YXMgbW9yZQ0KYXBwcm9wcmlhdGUsIGFzIGl0IGNsZWFybHkgaGlnaGxp
Z2h0cyB0aGUgZmFjdCB0aGF0IGl0J3MgdGhlDQpub24tTVNSX1NQRUNfQ1RSTCBwYXRoLg0KDQp+
QW5kcmV3DQo=

