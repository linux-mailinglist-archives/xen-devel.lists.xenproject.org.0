Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52915105EE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 19:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314090.531998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njPLk-00040t-MJ; Tue, 26 Apr 2022 17:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314090.531998; Tue, 26 Apr 2022 17:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njPLk-0003yV-Is; Tue, 26 Apr 2022 17:51:44 +0000
Received: by outflank-mailman (input) for mailman id 314090;
 Tue, 26 Apr 2022 17:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/nE=VE=citrix.com=prvs=108c91f88=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njPLi-0003yP-Pg
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 17:51:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8584125a-c589-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 19:51:40 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 13:51:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4817.namprd03.prod.outlook.com (2603:10b6:408:9f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 17:51:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 17:51:32 +0000
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
X-Inumbo-ID: 8584125a-c589-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650995499;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=LZrlXuDr5SRMqD6btn73rSUnTkYmGZLru5ydx+LYhIo=;
  b=VauqNQtCOgS12Na5GSQcdxsjnAO9CPII6XScQmnY+vbg8V3e4dT9IOb/
   w3g+D2eH5CttVnhQsg0hWx/Tn7jP7BItSyuiL/kLNe3a+PPYSRd/OGueo
   f3a9/jLdz/izv3Z5j8HUaXhoa1RE3mp+7j4y+yqRWt5TFS/V+vxzLFa7/
   M=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 72426798
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w1ulCayVzbwwdNBAyHh6t+cyxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 TFNWjjQa62ON2P3ctsib9/i8E8B65CAx9U2SVNtrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliruVQCoCN5H1yO0+UhwGFw1PO6NsweqSSZS/mZT7I0zuVVLJmq8rJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTuoAwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3P+fBpvDmDpOB3+JrqOov0aNnQf9hYn2md/
 jjmpGKlPyhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQo3OavxhaR9tZFcU77h2Azuzf5APxO4QfZjtIadhjvslmQzUvj
 wWNh4mwWmMpt6CJQ3WA8LvStSm1JSUeMW4FY2kDUBcB5N7g5oo0i3ojU+peLUJ8tfWtcRmY/
 txAhHFWa2k75SLT65iGwA==
IronPort-HdrOrdr: A9a23:FrujtKg28nzMwM1Bnko2KKuYn3BQX3l13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQZVpQRvnhP1ICRF4B8buYOCUghrREGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSgzPIXOrIouP3lpxA7N22pxgCcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYqYLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRPBky/JlaQkEuDzYIbiJaIfy+AzdZ9vfr2rCpe
 O84SvI+f4DrU85MFvF+CcFkDOQqwrGo0WSs2Nwx0GT7/ARDQhKd/aoz+hiA2bkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DMfeEEo/gxiuKYlGchsRLYkjTVo+VY7bVHHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZek6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z74HSKyGG5fIyQZ0WS9igF3ekHhlTVfsubDQSTDFYzjsCnv/ITRsXGRv
 fbAuMlP8Pe
X-IronPort-AV: E=Sophos;i="5.90,291,1643691600"; 
   d="scan'208";a="72426798"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ9wkzOOjmjv5d3wao2fkRSUw+WFEYo93PpOTfDLVBqh+JmOl9Nd+fkY1INEZ4UxReQuDLrH39qzO4P06s2HHXy1KG4FoE78xfuCzDCc3PM325QCB5BxzVpWZ28RFv/I8fHtmLSrXuLsyc+cHI8zktao07BD4GVja2qsyRHIiShOVf0ldQ52bVKc9qOCYw7EHO0iFgHJxbR/I45nwd8mnK0k2volOkrDVxOMvyqQl1jiLQEUYe2dep7Zb2oc4ZSWBcnr8xzaJDoE2fWSyhYrATk0O1cbCHxK+RvBAVLlsWk2BDxxUb8bZCQ2QdUdwwtCU/tWw6hAO2ymfMl7kBmG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZrlXuDr5SRMqD6btn73rSUnTkYmGZLru5ydx+LYhIo=;
 b=iWpnxLoJzy/tIYOsyjkC1JYD1SsGlg3EDw5NEuXPwqR7QQ2LTviIz7LPjpNNnmDo2eE7x/cNXJtp1Lci19gam4SadaB20ckwuFjUCJEmL9yFU8aEmAzDf7vzUJY7IYwwNWqiZerD5uDHPrGk0rLYdVZorvw+ixgPZCpMI4yrsbbfYCmNVPtAjAXoC//xH9wJ6CcqzdMki/yKY28DBAL54+wrenlxJAEpe7a+t6e25q6KzcfQ9j/87Mc1phBXhITe8Df6eT/mSwL6fPko23x5b6WwgeUQZA5dMI9Ibs9KEamzDZwMnGwIQyWiCicgOzjYoRl99Boic5z4qEiPn8WGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZrlXuDr5SRMqD6btn73rSUnTkYmGZLru5ydx+LYhIo=;
 b=g8R7TYbTdZcSWbkkfxBE59Axpx+CTn+P3n5XUTySf3RGqAXMz2KdFxpLN3WdDi9Rq9UnLkKATbPj/vaWM+4fB0+rezAS32uNRJemd0wVfXcDSydwciaciXhqN7BD7lJsrrsrwLbtKS8BSrdDWU4PG4tWC3r4J4n2KdywxsQPUVE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Kevin Tian <kevin.tian@intel.com>, Edwin Torok <edvin.torok@citrix.com>
Subject: RMRRs and Phantom Functions
Thread-Topic: RMRRs and Phantom Functions
Thread-Index: AQHYWZZDIrEkmq9fL0+3qLNT2+7QyA==
Date: Tue, 26 Apr 2022 17:51:32 +0000
Message-ID: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de86fec3-cff5-455c-1e5a-08da27ad6658
x-ms-traffictypediagnostic: BN8PR03MB4817:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <BN8PR03MB4817D17190CF730762912A69BAFB9@BN8PR03MB4817.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UmQLoCLVzY43GOTSZu1Rd/gFaBfupjkj22JsfUwr7I/Z7XgRWLQu90ILFlaJ30gQkWvN9fRnRPNaChFekCjIGV008EzwRNvEgxfM/5cdU2N6UFJh8eSTpxs4E0TGXfsyZl3C7st0fpNDPaHYxVVI87EXNtHSawBc+kpOmqvrN4jbaWU24/QqxATfndc6E0dEVFdqVSe53BSyOpDB4SmKytZe0Pg7N+YduKAcznnkJihxQLo4lwP84BfjjLlIVzBvPUgjAj59f5cOS0dSEpt5afaUJIwRe2vgBmE6tE2Rs+zEoND02TwaF0G6Lat0G5RMuZiOV0mO7UUAuhJDbspRufmOZzyeayUC/Gl5a36igaHa2IQ/J9Vz25/emnDUHTG2ZTq2SYanztBdpJemIzBuk1KsfRLiaTdV4CLjVb+vK0i6EdwnOYomZT5Pm/cKBm4Bs+zuGQ25/AcCHXB/kxtqxg9ZdjHzfq95ayOic3ceS8QIIIlVtfbcHEMMZ8yDOTPulpiKhUIn+mw8Ni5Cz4/W+y7WPx7hdT2J6ECkiawe2I671Qoh0J3VkIkhGhaRciw3b8M/RUCcndg9yKdzyfpUZPo+CwAVbO0/AjWAEjnifZG82X4uS4XD4X4h1RcEbgtxy3oWr9l+lGg9JBNsjLFHlJtIOKTY+1d5o/ZIThxgM/D6lfQcdw2XLLWIWu9vNpTlXuivb7qeMMWguTCWDgUmAPbsNR7nVYVUtSAYvTp+rbeAi6Ot6RBKJDgm/nXPHfzT2HDlKys8xmXnrjlROceGTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(3480700007)(26005)(86362001)(6512007)(71200400001)(82960400001)(31696002)(6916009)(316002)(8936002)(54906003)(91956017)(8676002)(2906002)(66946007)(66476007)(76116006)(66446008)(4326008)(64756008)(508600001)(66556008)(6506007)(5660300002)(6486002)(36756003)(2616005)(186003)(83380400001)(107886003)(31686004)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHNWYm9OZW41Ujhadk82ZHFRclNYRlBDaVhmYklONzA1TGpGYUFlNXNuZDgy?=
 =?utf-8?B?R2hOSTlpclMxaHgxMmtjTlFZL09BVExpa1pkL0F2Mi8rSm95NDdYYzN2NEdP?=
 =?utf-8?B?NGR6eU9jdnZ3Z3BUSk1iNEJsZWRUWDZtd3dlTlZKZFJOcnFpeDZYRjNEWWpJ?=
 =?utf-8?B?VGcyODBvb3h2QS9Bb0tHZXV3eC8rcmtZelRzTjBKeG4rN3NtbDBKRnp3UkZG?=
 =?utf-8?B?SmpNaitibERHeU4zQzdLQkkxKytHL0dpanlBbHhPWHJCeS9vV0tyaVMzNWU0?=
 =?utf-8?B?bXB0UHZvZVd0WHFOSjJCU2wvV2h6RUFXS1k2OEo2OEhMZzBHUE8xVnRXZE1t?=
 =?utf-8?B?ZzlBWExyU0RzbmJhSnh5YnZlMlo4cURvWUFyWlpVempaRjRsZFo0bTR5T25P?=
 =?utf-8?B?aVBoUk1Wd1Zid0lDNnZXeFRYeno0K0hNdzA1dkRiSHZOcFFkTkwrdGlKSVU2?=
 =?utf-8?B?VllhQXZYa1gxa29UVENWODEzM1Z2YnBoOFJxMENXVHhaRnlyRVp5aUdlbTJN?=
 =?utf-8?B?aFF2MVFpWTlNWVpwWmZLOXl4SFFsbFdWRGhQejJBM2preWNacCtLeG1zeFRN?=
 =?utf-8?B?QW5aTTl0NXlPV2o3T2RGclZTZy9QVk5YVUJqSnY1TlF2VGMzVE5HQ2FLNzRr?=
 =?utf-8?B?ZmZiN1NPRmJLN1ovTTVabzZjL1BmeXhZZEFNYldEVkRMcEZkMnZIWFEzK2Zk?=
 =?utf-8?B?TXhjRlFncE9ucjYzNnMwUkUrSFFpNmdEOEI5UVpJNVE0encwbThwN0R4MUN3?=
 =?utf-8?B?VkJpUkN2eU5tdnhvN3I0cld2NDY4OGFLSjRtTHVJa2dZY2dXeXJyeG5XT2RJ?=
 =?utf-8?B?UnkzSlU0NTJPT1BrNUpGZ2RDRStDZkJUdXI0Ymp5dXpWMTZWOG5Delc0Smtk?=
 =?utf-8?B?Z0lDMUFsOG0zRCtvK2VmT1dJSDd5ZXExZmpVWlRjMUFCeVl3VUxadW55ZGRy?=
 =?utf-8?B?MGkyWHg2UUlVTVdWYXovcjcxTzh1dnM5OVNvMzA4bXlPd0dnSnREcnpkZm5J?=
 =?utf-8?B?U1JpUnd0cFVaZXBleTFuMGJ0ZTJhdG0valVseVNyTWxrRE80ZnRFOHRKMGFk?=
 =?utf-8?B?M3VmUVpNSGkxYmpCUjVmNmhjZUVHNjFhaERpQkhUZmgyK1VqS3BPdTJJNGNK?=
 =?utf-8?B?ZXNINW5oQ3l3ZkRGaUFiakozT1RCazduTmdicTAzTlBTQ1FhYXJKMGJUN0F2?=
 =?utf-8?B?T3FMTmVUZXkvcVdIZ2dRdytzS0RhQnJFK1RiL0xqeFkvTUlwa2ZreC9GaEpJ?=
 =?utf-8?B?SUdQMTBwR29jblZoNkcweXgvTy9RTHYvcDlHd3JPRGFlYjZJRWZQUE5va055?=
 =?utf-8?B?VFU5WG1oc0tPeUxRRS9PT1plVE9UWmcxYlkxNjgyVHl4Z1hDeG9jbVFUZC9I?=
 =?utf-8?B?cC85OEJlMjJuVzNJMzNBZDd3Tm9wRENCMGJ6TXArRTJscm9NVEd4VXV5RlVm?=
 =?utf-8?B?SEh6eDRTdjRHQ0w1d2x2NWxKajB5TjRlazhWbWlGZUFFWlFUdnFjZGJYampY?=
 =?utf-8?B?dkNUTDJHRnc5bkVyRHVCSzQ1NGUvamI2ZmJZR2FiNDZjNW1FSlZ0QnZpUy9n?=
 =?utf-8?B?dGRHNEFXdXpvcFR2Q3I3a0k5OW1WbDE2aUJucGdQV2NvdVVVbnR6bTJhQkZI?=
 =?utf-8?B?MjJ3VHBKL1M0RFNxdCtEQmNnVDhLS1kzdytIM1lmRVhuR0pqUThnTG1SeFdP?=
 =?utf-8?B?eVEwZnNvVElpWmc3YTF6ZndKSnJ2d1dwZDk0U2xaZ0ZKNlBLdkI5TmFkVlIr?=
 =?utf-8?B?bDFsWEdPb0ovNE91MnlXSFQyc3FsWDdzYVc3RXVDZmIwL2t1OEtmUXRrbHd6?=
 =?utf-8?B?VlFOYUNGZ3dTTWhVdXpWeVdEeXlGaFJaWkIxTVQzN1VkYkxtLzZNQkNqRjVs?=
 =?utf-8?B?bzFKcldGcGFlalhiQkhtL1huMmVVQUwvdWNPQkh1bmdJQTdXaUYxZ296cmlI?=
 =?utf-8?B?S2ZFTllWbGZvUjZ1RGtIb2hXajRxWUo5Qlpvbk5IOVVpWUU5N3JaaXA2MzRP?=
 =?utf-8?B?bUk2QXNaQTNBak84dE9FdnNaYWptdG9NSFAyR00yK2RvSWpGcmp0elpLZGtD?=
 =?utf-8?B?LzR2ZUh0eWJaQk5PcFNZS2Rld3hxb2ZZRkJNeFBYaVorQzJJWVFBS1Mvb0w3?=
 =?utf-8?B?VElrSHJkMERlRU0vYmZWdE5HWkRVMDVYb0pLTEhEQ01aUm50UEFkbldwN3hK?=
 =?utf-8?B?SGx2R3VtWW5lVjJNWUhsck1FbXEwa2lkbCsrVVkxbXRiMllCMlgycnFTa0FI?=
 =?utf-8?B?ZCtvczh2TGF4Q3EzaVg5eDBUZmxFMWEwdWhqRTZFdjZKNWFMOTNnaUpZUGpC?=
 =?utf-8?B?bzhhbjQ5M3dzbGowU1VVN0ZLREZlVmkzeXB4RlRNUjNESDJWZG1JTFRTSDE2?=
 =?utf-8?Q?c3X6NQ/o718HZ+sQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E18A4C9D1DE2C43A3F90840146AB3F9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de86fec3-cff5-455c-1e5a-08da27ad6658
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 17:51:32.5754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu8jzzgrxltl48ivJIwtEmxuq9Dyu33U6posPZX9y8HG5msn8lBTZIRHu4l+wLqpr6yPSn1le6Y64iwhvAzE+14iC5hrnja1c0BZjrZcx20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4817

SGVsbG8sDQoNCkVkdmluIGhhcyBmb3VuZCBhIG1hY2hpbmUgd2l0aCBzb21lIHZlcnkgd2VpcmQg
cHJvcGVydGllcy7CoCBJdCBpcyBhbiBIUA0KUHJvTGlhbnQgQkw0NjBjIEdlbjggd2l0aDoNCg0K
wqBcLVswMDAwOjAwXS0rLTAwLjDCoCBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIEU1L0NvcmUgaTcg
RE1JMg0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstMDEuMC1bMTFdLS0NCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArLTAxLjEtWzAyXS0tDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0w
Mi4wLVswNF0tLSstMDAuMMKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2IgTklD
DQooYmUzKQ0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICstMDAuMcKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2IgTklDDQooYmUzKQ0K
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstMDAuMsKg
IEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2INCmlTQ1NJIEluaXRpYXRvciAoYmUz
KQ0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwtMDAu
M8KgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2INCmlTQ1NJIEluaXRpYXRvciAo
YmUzKQ0KDQp5ZXQgYWxsIDQgb3RoZXIgZnVuY3Rpb25zIG9uIHRoZSBkZXZpY2UgcGVyaW9kaWNh
bGx5IGhpdCBJT01NVSBmYXVsdHMNCih+b25jZSBldmVyeSA1IG1pbnMsIHNvIGRlZmluaXRlbHkg
c3RhdHMpLg0KDQooWEVOKSBbVlQtRF1ETUFSOltETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFsw
MDAwOjA0OjAwLjRdIGZhdWx0IGFkZHINCmJkZjgwMDAwDQooWEVOKSBbVlQtRF1ETUFSOltETUEg
V3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjA0OjAwLjVdIGZhdWx0IGFkZHINCmJkZjgwMDAw
DQooWEVOKSBbVlQtRF1ETUFSOltETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjA0OjAw
LjZdIGZhdWx0IGFkZHINCmJkZjgwMDAwDQooWEVOKSBbVlQtRF1ETUFSOltETUEgV3JpdGVdIFJl
cXVlc3QgZGV2aWNlIFswMDAwOjA0OjAwLjddIGZhdWx0IGFkZHINCmJkZjgwMDAwDQoNClRoZXJl
IGFyZSBzZXZlcmFsIFJNUlJzIGNvdmVyaW5nIHRoZSB0aGVzZSBkZXZpY2VzLCB3aXRoOg0KDQoo
WEVOKSBbVlQtRF1mb3VuZCBBQ1BJX0RNQVJfUk1SUjoNCihYRU4pIFtWVC1EXSBlbmRwb2ludDog
MDAwMDowMzowMC4wDQooWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDE6MDAuMA0KKFhFTikg
W1ZULURdIGVuZHBvaW50OiAwMDAwOjAxOjAwLjINCihYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAw
MDowNDowMC4wDQooWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDQ6MDAuMQ0KKFhFTikgW1ZU
LURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjINCihYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDow
NDowMC4zDQooWEVOKSBbVlQtRF1kbWFyLmM6NjA4OsKgwqAgUk1SUiByZWdpb246IGJhc2VfYWRk
ciBiZGY4ZjAwMCBlbmRfYWRkciBiZGY5MmZmZg0KDQpiZWluZyB0aGUgb25lIHJlbGV2YW50IHRv
IHRoZXNlIGZhdWx0cy7CoCBJJ3ZlIG5vdCBtYW51YWxseSBkZWNvZGVkIHRoZQ0KRE1BUiB0YWJs
ZSBiZWNhdXNlIGRldmljZSBwYXRocyBhcmUgaG9ycmlibGUgdG8gZm9sbG93IGJ1dCB0aGVyZSBh
cmUgYXQNCmxlYXN0IHRoZSBjb3JyZWN0IG51bWJlciBvZiBlbmRwb2ludHMuwqAgVGhlIGZ1bmN0
aW9ucyBhbGwgaGF2ZSBTUi1JT1YNCihkaXNhYmxlZCkgYW5kIEFSSSAoZW5hYmxlZCkuwqAgTm9u
ZSBoYXZlIGFueSBQaGFudG9tIGZ1bmN0aW9ucyBkZXNjcmliZWQuDQoNClNwZWNpZnlpbmcgcGNp
LXBoYW50b209MDQ6MDAsMSBkb2VzIGFwcGVhciB0byB3b3JrIGFyb3VuZCB0aGUgZmF1bHRzLA0K
YnV0IGl0J3Mgbm90IHJpZ2h0LCBiZWNhdXNlIGZ1bmN0aW9ucyAxIHRocnUgMyBhcmVuJ3QgYWN0
dWFsbHkgcGhhbnRvbS4NCg0KQWxzbywgSSBkb24ndCBzZWUgYW55IGxvZ2ljIHdoaWNoIGFjdHVh
bGx5IHdpcmVzIHVwIHBoYW50b20gZnVuY3Rpb25zDQpsaWtlIHRoaXMgdG8gc2hhcmUgUk1SUnMv
SVZNRHMgaW4gSU8gY29udGV4dHMuwqAgVGhlIGZhdWx0cyBvbmx5DQpkaXNhcHBlYXIgYXMgYSBz
aWRlIGVmZmVjdCBvZiAwNDowMC4wIGFuZCAwNDowMC40IGJlaW5nIGluIGRvbTAsIGFzIGZhcg0K
YXMgSSBjYW4gdGVsbC4NCg0KU2ltcGx5IGdpdmluZyB0aGUgUk1SUiB2aWEgcm1ycj0gZG9lc24n
dCB3b3JrIChwcmVzdW1hYmx5IGJlY2F1c2Ugb2Ygbm8NCnBhdGNoaW5nIGFjdHVhbCBkZXZpY2Vz
LCBidXQgdGhlcmUncyBubyB3YXJuaW5nKSwgYnV0IGl0IGZlZWxzIGFzIGlmIGl0DQpvdWdodCB0
by4NCg0KfkFuZHJldw0K

