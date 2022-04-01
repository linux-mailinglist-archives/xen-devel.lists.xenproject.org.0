Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA44EF217
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297470.506765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIaC-0001By-5l; Fri, 01 Apr 2022 14:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297470.506765; Fri, 01 Apr 2022 14:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIaC-00018p-28; Fri, 01 Apr 2022 14:49:00 +0000
Received: by outflank-mailman (input) for mailman id 297470;
 Fri, 01 Apr 2022 14:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwaM=UL=citrix.com=prvs=08375ea47=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1naIaA-00018j-Fn
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:48:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daf84789-b1ca-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:48:57 +0200 (CEST)
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
X-Inumbo-ID: daf84789-b1ca-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648824537;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ArN5hP5IVRUTUENO0D2I9dcwaBhOhuPXd1w1bhIfECo=;
  b=Z3ALc707CZEA6XH1e+5mq3MtgjdGUn06Gc9lgQFq4afk/byPJ6mkPiAJ
   +7OJYoK243qCYIidWqI28dBSvKLb/3Soptg/fROjg87myRYLXuZtsGEhB
   pIWHpu0mC5Z+LjU3tP01vQNbtH5WRfUtaSyAlymKt88rbEyoHzTJdlZP7
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70165606
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E/lkfq4tUimxIkq+BlKMRwxRtDnHchMFZxGqfqrLsTDasY5as4F+v
 jQaWmrSPavcZmCmf9pyYITn9BhU78CBx4I2Gwpk+y83Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSUTTwKfZT1uN09CT55I3lufpUd3q7YdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5VBMGQyMkyeC/FJEnsYKbYio8iVvEvcYRJo8mOHq5MvzmeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSPSuLeHCSBgEek5Dk9a4JAUNVhzhCSn/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XOFyvDq+78QSeafHFMcDRcPXNsoR4tuYGLnW0lsv7Yoj+P+oaRh8a9Jzz/y
 iviQMMW1+RK1p5jO0lWEDn6b9OQSnrhE1ZdCub/BDvNAuZFiGiNPdPABb/zt6ooEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AAzT8Z8rW71qi/+IOi8BQ2Swm8zba7onhezP
 SfuVf55vscPbBNGk4cpC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vf/l2Pq
 owPZpbSo/idOcWnChTqHUcoBQliBVAwBIzsqtwRceiGIwF8H3omBeOXyrQkE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:anr8a6DirD6GAorlHegCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuqKdkrNhQYtKOzOW9ldATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0idvrD
 D+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uWseSGqC16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="70165606"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5ml9az2opX/9Momo0g6GOQjvjJhGXIOGR+1Q2UUHB6Xnz4E+JCspG9W+NDaZwG09whiQUN+1YqA56poSq/NILQd6pi3Cvp69sdX0llHiSQ4TCzP+u6cgeuIV0rRqoSQtqpGrD91y5kHE+xjArgsgo97EoqIXwayR4Jf7XA4kSBoTwhfJcjtQXRkol8XKSRAMsWzGfp1RqIESYA6Y3WbOMe14R2pHSnga8+h1z6bjE/QT760D39CXivwoJJ25MBTUhBHu/+zplN4LgD411XI9Fyo+cho26TiQo0NxBxzyAduuBTt7QZouOzF0p423Y+fodEe+/ACYHrw8AjVphV5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArN5hP5IVRUTUENO0D2I9dcwaBhOhuPXd1w1bhIfECo=;
 b=L0kfNX1SxlPpyTfobwv5ryCq4wd6X/SBsStk/XHbwCpgJNkga/9VvDBuJPU99DQLFXODxEE0ZbfIGZOrKXG6wQE3QwuoT+qLkBrOZJjd+WbM87mtQODVTn/IYHVwxfxTKOV/b/DTyHO9M68KrIqMoms0+WSiWVfzgnY3fE/8Cnm2cu2LjtRoJ8L2rONPnFfmAAgR9talFWzW68XZN32Be7RqkSJO9PKh8Lra8HWDnLLUyLPB9Qz+EkLOFUuAATvjwqOx6ykbjbjnXJne6N7fnc2eNzWfCCq1qzDjG3gxViLoRK9wpk0nfki5er00W+XGaIjkCpLBNwQglFFMeYJdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArN5hP5IVRUTUENO0D2I9dcwaBhOhuPXd1w1bhIfECo=;
 b=JYQnymR3N1j/umqusWliTxJywkgcTDej6KP2zJL2sw3B33J62GEjLXhKQfUoZ1sDWZYUeEjnIVQtnJGPCxlsm0aiNraNCMhhvf8TDCvEZRfgprcmdvQpK5b85xK9UTyVDhQZoaewDvKAgMmJdmtz6wuuGaora42SX6cl6ACyFyo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Topic: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Thread-Index: AQHYRdaC1Ty1lDbR3E6vxjqdlx39GKzbI4SA
Date: Fri, 1 Apr 2022 14:48:49 +0000
Message-ID: <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
In-Reply-To: <20220401143720.23160-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 924a727e-9842-4950-cde8-08da13eebbd2
x-ms-traffictypediagnostic: SN6PR03MB4365:EE_
x-microsoft-antispam-prvs: <SN6PR03MB436534D79C28F8A36BFBD784BAE09@SN6PR03MB4365.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h5I2eM+v6SCF5dvFgswrgHY+icehtQb92JPm8w3TT5DMzZISC4qopdf9Q5Blt+kQjseva68DPBC5zQL1f/Y8GMejO2WON6ocNW+B9897a459wxWNyjeiwM9TNE+gsuTSEcR5GHZ2qa84uShFgv4vt5OuqLbSOmCOq+GVPSnDdhDWEYBcsh0e4Vk68Agx7V1VlUCruK15+A4mtMVAO1BsszRoNEj98TqEeBdO3gIRUu2Ebjl/GZQSmiVBkmQcK+2H2e33i1jdbgU2mAuYbcXF+qP4yQSwW2fixdCUm2kmoqJGx9rvvT7LacKvWopOilu1bcxIKf9OE8wgSIOL8ZoB5e8rIP+5oSOT1pLYV+3woQnY6h15YxanBbI/KaRTO6GFLFLb23E+ENdtzrQnJc156WsnFFB2vu415rFqRfEdEWkSMHKE/sZHmJ5FGHJhE5CoEzFClAsQ8yEgxU/+zIsqmyxtmYppW6JI8SmSsK1/G2YvjjyaCxVvgm+QX3GBm5wVRxVvBrQBtRDfGzCDTMCe6rAGgkUYgl1BPnRg1ipkSF1NLYdwmKiSTbZTISPLQmIJsw98bcPyq7gdBMORlijHn1l97ea5FuAiTI+/sviil2tSFuQDm7z2KpB8EVHGAaMT3WmUzWYycrC2HtTqtIZSdYPXgKFlmURS5S7brjq/RgMa41dshph1m5U322oUPdqXGmzHrCr5t7sYAO8+4uoCbKiks8QaktlJyiUQjNsLa3FhzF+nMaoFeI2WrIpTyNAGNQeDFSUXJmsSKAoe8HnIHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6486002)(4744005)(31696002)(107886003)(38070700005)(86362001)(71200400001)(53546011)(5660300002)(6506007)(6512007)(55236004)(31686004)(36756003)(38100700002)(122000001)(64756008)(76116006)(82960400001)(54906003)(66446008)(66556008)(508600001)(66946007)(26005)(186003)(66476007)(8676002)(110136005)(91956017)(316002)(8936002)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTJkQ0NrTHVRVWtTZTVNMHZOR1NxdjBtZ2VXbENDT2NGVWNPSWtoRUd3YVRR?=
 =?utf-8?B?WXRnZVVjbzBYTm1IUWZZOWR5WjFBUTUzK0U3dHB2VXAzb1JzdVltSjJOV1kr?=
 =?utf-8?B?Ulh5MURqU2lUSnljMzRkQVI5WGZWWCtyNmJjZWtOUy9mU1BWeExnUGxtMHRh?=
 =?utf-8?B?MVhTNjZ0b0UvVmkzYmpncnB4RXgwQ3dOdWNVdGhGT0JmdjFJMTRvOXZzYTA1?=
 =?utf-8?B?VmNxZzRseFpJUmhTeGhleGJoZzF3RC9BdHBvd3dja3BPY01xYStrcFJSQzJC?=
 =?utf-8?B?emIwSkNCSTczMm9HSndhMWNnMjA3NVV1S1RlZWpvQ2xIV3p6NUxqWGUxeGZ3?=
 =?utf-8?B?Z1ZlSU41MnlXNThnWHRPaTRIVWxsYnNEa3FWTEZJYTVDU2ZQcVA5Y1JUT1d5?=
 =?utf-8?B?OUw1UlIvWU83ZmI4SXYwbFRkOWhlVXEvdkQvMXNVMmNVYXlUYngzWVlzSmJp?=
 =?utf-8?B?NnpBcVdkTWpaMng3ZzV2UnpuU2JVcGtHTUYrR3lKK3Z3cHZ3RWhWVE1yTkda?=
 =?utf-8?B?NUQ1Z2xyNW9qK21hKzJtTENXa2JYc0VnZnRBRXJFakIyckQ5ejNxTEdRWjhL?=
 =?utf-8?B?bTdNN1dDamNUaklSMW13bFVrc3VoQmZRVndOV2tnbVFsTDlCalY0ZGJWYjlG?=
 =?utf-8?B?K21wb3VyVWN4L255NmoySmo0OXhDVUgyT0R2RFdPNHVhZWtEZTFicitvYSty?=
 =?utf-8?B?V1RUVktPdCtlYUZ1cUxRMjBFbnRSMjVTa3Jtb1IzWjFnUmhNRmEwN2pNenpY?=
 =?utf-8?B?Z3J3QStEdUpmc1dPVG95ak1rL2p0cTVkVmM1RVE4V1d1aXphcjNVcWdIdTZz?=
 =?utf-8?B?Z2FoazBQaGFqbGJ6dXhNcE52Smoybmxobk1GTHhnWU81L3ZQQ3FzNXE2VnZy?=
 =?utf-8?B?c3VFU3pyY2ZCb2Y3NVRER0JOWUlDeHd0ZDE3RUdmWnhkTVM2enhNVzJOb0dw?=
 =?utf-8?B?RTZMU1llSzBNSmVoTS9FYXhScGRZSHRVR0ZPSFZrNmFaZW9GTElWNFA5eHo3?=
 =?utf-8?B?RXJzV2VGOS9uNTE3dXJObzFqV1c4L3EweHFwTXBtam5VaDVleHI3TDJzNHJZ?=
 =?utf-8?B?YitVUFlBR2xiSWtCU2xtNDVSQ3ZVam96Wjh2bVpCajBFTjR5cEcybWp4TGRq?=
 =?utf-8?B?T2xnMDFaOG5TWHdmbjY0SGRTa1FpdnIwak9SS3dQNFk2OGdQcWd6WUc3WGZH?=
 =?utf-8?B?YlUzR0YvdGxoYlRmenNrY21XVUZ6aUk4bytWOUhxdFB5S0Q0VndGa2FENDZr?=
 =?utf-8?B?eDFYNHM5VHh0VG1lZzlWelpBaFp3dFI0ZWM0WkxPUXozaU1MSFJkVnE4a0R0?=
 =?utf-8?B?MVBqclFIenI4L0FRV3ZCdWViRXpKbU5EQldQd2g5c2NpcXYwMlZFSnpqQllZ?=
 =?utf-8?B?alVTWVE2bkpac0VlWlZMYlFzUWdXZmhXaUcxZTdyZWlFOFgvWVFHTG0wR3d2?=
 =?utf-8?B?T29oUlNRaDlRR3ZKSG11SVdBcnB0WFNvZFJMOGlzRmpSeXVhVzg2bnZ3YjZT?=
 =?utf-8?B?TnJtcm1nR2hqVEdrVFV6bTdLeGV0QVIybzBraHNpMThWbmlrcnNIRXp4a3RZ?=
 =?utf-8?B?R240ZVlad1dQaUJqUk1TVUM1SE94dGhVVjhRNHAwUGdFdzF0K2JNNkEybE1Y?=
 =?utf-8?B?eCtqTVlmdWsvRjk2UFRkYS9WSjg3QnlRRFRIMi8wM3U4dUZCNGppeGx5MXBJ?=
 =?utf-8?B?cEpDcm1zMDgzQzFwWDZ3M2FRRnFxK3lSRCs3bTVwVFB0ditMUXhsajFIdHY1?=
 =?utf-8?B?cWdDNHprY1BLWlhHa0ZHVkN0Q2Q1NXRkK3g3MVYzV1lUSEdoMU4ya2l5MU5N?=
 =?utf-8?B?ajVWbmlvODBjTnNZSFZQQkNLY285SHR0SjBhZldPRCt3aktqaHVNbmNJZG1C?=
 =?utf-8?B?Y01KYXQ4eXJ4S0xqUFBwNUh0MlZodWtBczF1QWJVY3U2dkVIenk3VHEydUhh?=
 =?utf-8?B?VmFsRkRISXRYL0NpczVCVG1iYW1CdVkweHJ5THh0QlJ1ZGU0VWpCWnFqODhT?=
 =?utf-8?B?eHViUEpITnNBN3N3RUVsM1d1QmtrUTR0dDVoNHZwam1lc1ZySU9LNmVHaVRW?=
 =?utf-8?B?RlJscmd0TEVwUU9obzhkZDJZODBubjdETHN1MjduNllpZEd5L3ZmUlgxZWpB?=
 =?utf-8?B?N3B2VXZNQUNXNHpRVTBBT2cwZys1SXpGNzJPbmc5UlZ2OUZMbTlxSzFRUlJU?=
 =?utf-8?B?bWlPRkpCekQwS1NhR0xDNkVRWTRibUtmWXR0a1FsSVRFZDVGa21ocCt1akl3?=
 =?utf-8?B?YzlCQlQzLzVvS01qU2JsSmMwSjI5VEZJdmxzaDJoeG9Nc2NwL3VZa1Z2R043?=
 =?utf-8?B?RzdEd2ZsempweXZ3aU0xNlhSSmlZNnpyUERHSjZRd3pSb1daVkh2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48C008B13BFD0647B8A81D980C3C39B6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924a727e-9842-4950-cde8-08da13eebbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 14:48:49.9707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFzgtVbqLhfuiBdvvVV8i91LcoiLWhYGWYraHK9p9r/mrw7wnpQ/IDHRW8gwwZZXKUfKur0p5BEklzBaufIXR9IACdE8GuPgZjXIU+mVmyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4365
X-OriginatorOrg: citrix.com

T24gMDEvMDQvMjAyMiAxNTozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBTZXR0aW5nIHRo
ZSBmY2YtcHJvdGVjdGlvbj1ub25lIG9wdGlvbiBpbiBFTUJFRERFRF9FWFRSQV9DRkxBR1MgaW4g
dGhlDQo+IE1ha2VmaWxlIGRvZXNuJ3QgZ2V0IGl0IHByb3BhZ2F0ZWQgdG8gdGhlIHN1YmRpcmVj
dG9yaWVzLCBzbyBpbnN0ZWFkDQo+IHNldCB0aGUgZmxhZyBpbiBmaXJtd2FyZS9SdWxlcy5taywg
bGlrZSBpdCdzIGRvbmUgZm9yIG90aGVyIGNvbXBpbGVyDQo+IGZsYWdzLg0KPg0KPiBGaXhlczog
MzY2N2Y3ZjhmNyAoJ3g4NjogSW50cm9kdWNlIHN1cHBvcnQgZm9yIENFVC1JQlQnKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

