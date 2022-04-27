Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89A5114A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314785.533003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeYn-0000t2-Hp; Wed, 27 Apr 2022 10:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314785.533003; Wed, 27 Apr 2022 10:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeYn-0000pl-EV; Wed, 27 Apr 2022 10:06:13 +0000
Received: by outflank-mailman (input) for mailman id 314785;
 Wed, 27 Apr 2022 10:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njeYl-0000oY-EE
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:06:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a824c0eb-c611-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 12:06:09 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:05:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM5PR03MB2618.namprd03.prod.outlook.com (2603:10b6:3:48::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 10:05:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:05:55 +0000
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
X-Inumbo-ID: a824c0eb-c611-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651053969;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xuH8RRONxl+DQX/OIKIJJ9vSVJLrKLopyzbW8H3FAnE=;
  b=JYrUK/iHXNuvhmSLLGGsJ8VuI5j7uGUBpPPXbM0Dmsi7KeDW1mvOatOw
   I+7VgknHOdQXrCEdoyR7UkDvN8tIM1Gka2IMmNPiVFQyGLncF66MrmMeY
   t59V2H84sECduXdehbSjwpmbgifw83oAX2DroIItzGcqYLBA5ztz7X+wR
   s=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 70432517
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aF+OG67nPKkoT/vjqUXiagxRtDzGchMFZxGqfqrLsTDasY5as4F+v
 msbD2CAPayKM2Dxed13Ot7k/U0AvMODxtFmTQdp+XpjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjXVvW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSNdBcYOaPQod5HXhNpTgEjG7RhwJzudC3XXcy7lyUqclPK6tA3VAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YAgF/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+vJruDKOlVMZPL7FbIrqR4ySR/5vgWGUl
 kXbw3b6XRI6DYnKodaC2jf27gPVpgv5Uo8PELyz9tZxnUaegGcUDXU+VlaloP//lk+3XfpeL
 VAZ/mwlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpbdUnsIo6QGIs3
 1rQx9fxX2U37PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3ux7YRIjv0ljwW36vg==
IronPort-HdrOrdr: A9a23:NwaSvKEBzSDElh6epLqFt5LXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNFICPoqTM2ftW7dySWVxeBZnMffKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj4Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWna4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlWFtyssHfsWG1SYczEgNkHmpDo1L/sqq
 iUn/4UBbU215oWRBDsnfKi4Xi67N9k0Q6e9bbRuwqenSW+fkN7NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxEC3/rFuGoO5gLZvtX+9Kq1wVB4SKbpXZd
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFoifA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94aLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2bwqaWGLEPQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB/TJbo=
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="70432517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaYzN+GLsTuGjJVbNIANTyQJNgdDME/RCeB2nKLNXTp909joZ0JwYybxIh4zJQVq+ju7HQyeNMbzcgGVU3a6RPjvsEX8R2kX61+bohR1djpjTO64j7HTT2lgPjGIFmVjMTVbzXZi3pmxZvTL9/Ks6o3wB+bau4rFhOnDRUeNqaOJActHRpNuWhGPJhoO0zibNBD8T3YVEWm8Fu6nheQb8NJkRkc74DzYdRLVCBQcWRmlzoSlM30q7mG/Xhn2W20d48mtXzh8ZKn+8MtZ1VvmmBaL2K5B+JS4RyL0Vjr7yAJtzV7qSO/AckKaEfw7QyALsPZ0LXRInUc2jtVy1rsT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuH8RRONxl+DQX/OIKIJJ9vSVJLrKLopyzbW8H3FAnE=;
 b=gmYauG9WlsWjL1c2a19BWabZKHekClzJURbtfm+qQVXZOOxUD8/JsqQ6cWQLw/XiHM93FxujIKGUXIYM+M0Ie8kTBhROXKYaqKMfCxGR3PXNVvhhBV03Qb8vwGdfAyeA0crhnkPeEN++h7qLaVu5rr6Uxaii8WO/YzpiejeDKRezHJVTmj2SIAuJmkWGgUtsHfjBsxd4D1pbsbEPjXuRdxh3DG+u9iKmHC8g4GUk+hg55zLA/PlQd3hMmbtj56vevl+S92nmCZJleMu31o3KTOnmjLV5tddtdlA5TbBJbNfR9TdW2OEPVjntpn25VcNGLovDkogN8gBOTgSCQemH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuH8RRONxl+DQX/OIKIJJ9vSVJLrKLopyzbW8H3FAnE=;
 b=tI3nMDGXPuXZQEOTxjIEgPlUINd6nXXFC/6PMWVmY0hHfD9kBIds1b8APRFpMEJLyeWj6rSbY4tB+jlnv7MYHkrVv7D9bWNYZsVgaygLiQDMvNEkXiSXdybA8OPseja+eErH06xHU++SKTFdLPjbyxKZ1jkzZmFjaMJHkdloGT0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
	Edwin Torok <edvin.torok@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: RMRRs and Phantom Functions
Thread-Topic: RMRRs and Phantom Functions
Thread-Index: AQHYWZZDIrEkmq9fL0+3qLNT2+7QyK0DVX0AgAA0GQA=
Date: Wed, 27 Apr 2022 10:05:54 +0000
Message-ID: <f77ed15f-3dfe-e4f4-2790-7eca18ca9dfe@citrix.com>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <ec1efb6f-9d41-c018-582b-718254b55aa4@suse.com>
In-Reply-To: <ec1efb6f-9d41-c018-582b-718254b55aa4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63e658b1-ca4e-45f8-4348-08da283584a1
x-ms-traffictypediagnostic: DM5PR03MB2618:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs:
 <DM5PR03MB26189C592AD7B4872A849639BAFA9@DM5PR03MB2618.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4wPBu401OvQkUbdUKBNillSCykwrUWTkMnar2t7hYl8z33K6AW6lrXynQNlQan+d5aLML1rpHUZx+ELFTO7NG+9WtNM0L0bI6IjuyOS1no+TbStw8sSsIXUDNf/Sc0Mb5Cgia5BaXgLFAb2EZAtFpoR/taTmhfXeXvRCpHsrPOp7EUCFvcQ6B4jghzN8ca3S1ouzCFL/EIbEMEz0PsetMC+4G4iXvT+lxudkqUmebB9N4bWpKFDnVohPhPUJP5fpLvUj5v1/M74e7lCEuTI/rdu4GLGwGinIIun5sw5w4mvvBCjcUmRWc655qjwah9hS5Zki/H0bxaVcXV4kHmuSPp2KU72Ez4+SKsJVIFyfuDVGLPfwstIDChYCN+nDTTc/c03+UdwD/w/C9Op8k6+W1/cmYdQD+bSG7QnlW3mMwE/DKVYLYV9Fe8//YQQFKSPvTvXS4l+t0tVe8T0RwBk7CfmvTtasU65kQdVuMSJ8Fw/16epubWxNemOyUkE+e7h+kB1wDSZg9XCyksWo066lK8Of+f24tf6dulfteE4G+qiuAU9kmaEBAwwuDVplIbFf8pxHqb/2oTWXW0HR7piHj53yuFiDXozKjlfAbFgrFjfmxxts7gOpSwokjr8w+YqeAWoxhULPB2ZGPDDerQpaOxhMOgc3S3ozARB1MbvHDqneQ5UnnNeSgx2oGDxjwnDvybh23jzqLu4Yy1DaqYfic8VKZpJtp78wWHlVFiUtleAiUGBTY0+r1TYAuwEcAy5h1hgn2NNubtACa1GR52p5Cg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(316002)(31686004)(6512007)(26005)(83380400001)(86362001)(8936002)(54906003)(53546011)(186003)(36756003)(6506007)(2616005)(66446008)(6916009)(122000001)(508600001)(38100700002)(3480700007)(31696002)(38070700005)(2906002)(6486002)(71200400001)(82960400001)(4326008)(76116006)(8676002)(66946007)(66556008)(66476007)(91956017)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c24yTGV2RmtMV0hSQWlDNW9mNkJUdXczZ1BCNnF3ZHEwSTcvVVd1MFpEQUc1?=
 =?utf-8?B?MWpZV2V2bzRCSHl6OGFMamViSlhzbXRRb1JkYVlBdTM1VWJOcENRTyt6MnZh?=
 =?utf-8?B?dWJqVW5xanJqR0t3ajE3cHc2cW0xTFJCY09WWWVZZWhmWDl0VS9sdlpiYi9z?=
 =?utf-8?B?Q0NacXNrQ2VCakdaRXM3a2I4YmxhRTEwSUVReWt2dVROallpVHg0TWxqcitQ?=
 =?utf-8?B?Ymd6YzY1VStDbVRUNmV0Szl3SUNlL25DQ1NrdjUwNi9FbGhkdXZINndnbmdN?=
 =?utf-8?B?d1duaXFLdThwaDJmUzJuNW5EN1dTRnM0SVFLenBydkNMWWhzV2lMc1UvQjJx?=
 =?utf-8?B?WjhuRW9lREI5YVltVUZnMVlMcWsrVVBNeHVqV0V4dUc5aGkycFI2am10WW1M?=
 =?utf-8?B?a1dmMmMvK1JoR2o4OWlWajNHenE2dlJKV3Fzb3hrWnQreXhsNkZmd1JUQlNu?=
 =?utf-8?B?d2p2MGkzMGNTT1lhdnJyYzRyd1hQOGMyQ2V5SUJaM2w1VWlacmlRdytiTVJl?=
 =?utf-8?B?Wm9jUW5SL0pPZUZ2ZUtodXZ2V2NKNndrTGM4VkZia2s3S2pKeHcrZkRVRThI?=
 =?utf-8?B?SmJsRmhUeENSbllYZkJTMGg3NVJrTmJ3L0NWbWRNN2lCWTB0ZUZYMklTRFVx?=
 =?utf-8?B?YXRRSkNlWlRNaVA3anNwYXR1VDRmNjUxR1pJQlpqYUxrd1lTZVlUalNnWGpv?=
 =?utf-8?B?Z1kvbmhkNmpyaWpIS1JVdEFaRXkyQjhKRzkza2hKbEpSdzJReXhzSmFtb2My?=
 =?utf-8?B?MWVJNUFWZXVtdmZBd3B0b2h1SmhJbWorLzd2ZDRDaVh5RFFSU0lWL0VjUDdW?=
 =?utf-8?B?T05sTDdlY0h6MmRERzgyekRTOTJqdDJnd29EVUZDckxuZlo0M0pNeXJCR0to?=
 =?utf-8?B?VFRMNWdzV2lLQjhlZmhkYTRmMzVIOTNIMHlVZzNldjU2Q3ZYdGM4cWhtbTg5?=
 =?utf-8?B?cHBzUnJaUGwvemcxYWxjM2RvVllkdzc1elJhVVpXNWRTZnZCZ0IrS3B4V21v?=
 =?utf-8?B?SjJZVlk3YmhMUlpKQXdNbVh0TEpZbFVDRmxBeklJaFpUVEJyTEUxR2lYS3Y0?=
 =?utf-8?B?YzdXWXF3R0dabmdxbVNWSnJ2cFFtZG9jbnJiRFl5QUl4TGxia3NyK2RPSUFx?=
 =?utf-8?B?WnljQlM0d2VxKzJjQ2xlVWV5cWdWUWFyN3ZSRWxCZDVxaWpndGh2alhDbUFx?=
 =?utf-8?B?Rkt6cDIvMkgyUkJwVitTdW9XR0hLMkdxU1UvcEI5N0I4Kys3eVZrSVliUi9M?=
 =?utf-8?B?cEMrQnprMWFNc3prSWdLbTExWmoxc1pQNDVpeHNrR0s0c24rWWEwdTJPYkFS?=
 =?utf-8?B?N1BVeWc4NTJPZ1dFWjFIQ0Q3S2VBNGVaOWF6eFM5M3dYWjJRMFNYL3o5ZURn?=
 =?utf-8?B?RHJGazNiM0ZsVW9yaHJycFM4NU5JMlZXYys0SjFoTmpodGRaUHJuL1BmZUc1?=
 =?utf-8?B?YjZpWi9OUHMyaGZvL1hWN2xLN2x2WUF5TzBCU3o0VGI2L1pYUVBjZnRuVFlp?=
 =?utf-8?B?NDVEcmVQU2JmODU3cHd6KzFETXFFMmRQelRzU3FSTUpGSG5HczdsY1M1VG1V?=
 =?utf-8?B?MDEzUWRxRU5LQ3lwWUQyVzAzamtZTk01c0J1WkdjdkNza2pHSVBDY2NIQ3NX?=
 =?utf-8?B?WXFZL0xXT0RQRmhzejRvaTZocHZnRzIvQlFPQU05L3RjVkdwNU1qMU9ZS1p2?=
 =?utf-8?B?bitXYXNob1hYTit0RW05aklqU2lmWXZyTXNoQitMUVhvcGVRNC84MkdlQkgy?=
 =?utf-8?B?eStZZHlJODNJS3RNdGtiSURkRjJMd05YbHRvWG9PQ3BVRm5vREFyZEJMMldm?=
 =?utf-8?B?WHJQOU13SFhmZUNiUm5YSVJ3T2FwYlNFbTl1T04rZ3VGOHYvczBXQTFYYlFO?=
 =?utf-8?B?WUM0enFOT3FsRFNDR05IMmJ0eGZGdnpKa0VuTVlxVmk3TG1VcEIxZDhNK0VR?=
 =?utf-8?B?ZHpNbnpENE9URUxLQmRkdnN3OGNqRnNyRWQ4ZE9zd1hVNDQ0NFR4TzFnbzRO?=
 =?utf-8?B?dlRyZ0lZdGN6RkVGUjRPUHhsT25jbkdnUWtNZVBKcGMzUTRRcVpYdUVGdkhO?=
 =?utf-8?B?V0RWWllpbStKSFk1K0VnZ3NNb1pyRmRqamJrWHhVMUtVNHdhaWJJdE91eWVj?=
 =?utf-8?B?Z3EyZ2hmNVovY1c5eFlzUTV1aStFRVNLeUdVczlDSHpuNHoxTGtGRGVMVG1I?=
 =?utf-8?B?WU5VV2ZRUjhRbGhhZytBTkpOZmMvZGtuMlJzOWpSb3p1L2t1TFRxcU81dy8v?=
 =?utf-8?B?UFljWWVVTkkvditjTStrZmIvZWJoa2dBMXRTSmdlMm1wTlBMTVZiVXpqeWZy?=
 =?utf-8?B?ZktxNGR0U1A0Sm1iQmt3SHZ1bzJQaFhiVlc5YTNIMlY4TXAva2dpOGxQU3g2?=
 =?utf-8?Q?LaI1eICihYXXS/s0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2897CEE37CF8044B116798A43AE9F93@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e658b1-ca4e-45f8-4348-08da283584a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 10:05:54.9260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zp4Wem48cAPlnkFoD2qHUYTcBs+/g+3IOSsqFjt7bgvrInT1B/Mjxt3CC8UJqnNz4HRo5RGbm/E31ZXVLu2EBHcAfJXTaaG5CBNGmpIEd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2618

T24gMjcvMDQvMjAyMiAwNzo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA0LjIwMjIg
MTk6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBIZWxsbywNCj4+DQo+PiBFZHZpbiBoYXMg
Zm91bmQgYSBtYWNoaW5lIHdpdGggc29tZSB2ZXJ5IHdlaXJkIHByb3BlcnRpZXMuwqAgSXQgaXMg
YW4gSFANCj4+IFByb0xpYW50IEJMNDYwYyBHZW44IHdpdGg6DQo+Pg0KPj4gwqBcLVswMDAwOjAw
XS0rLTAwLjDCoCBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIEU1L0NvcmUgaTcgRE1JMg0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICstMDEuMC1bMTFdLS0NCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCArLTAxLjEtWzAyXS0tDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0wMi4w
LVswNF0tLSstMDAuMMKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2IgTklDDQo+
PiAoYmUzKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICstMDAuMcKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2IgTklDDQo+PiAo
YmUzKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICstMDAuMsKgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2INCj4+IGlTQ1NJIElu
aXRpYXRvciAoYmUzKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwtMDAuM8KgIEVtdWxleCBDb3Jwb3JhdGlvbiBPbmVDb25uZWN0IDEwR2INCj4+
IGlTQ1NJIEluaXRpYXRvciAoYmUzKQ0KPj4NCj4+IHlldCBhbGwgNCBvdGhlciBmdW5jdGlvbnMg
b24gdGhlIGRldmljZSBwZXJpb2RpY2FsbHkgaGl0IElPTU1VIGZhdWx0cw0KPj4gKH5vbmNlIGV2
ZXJ5IDUgbWlucywgc28gZGVmaW5pdGVseSBzdGF0cykuDQo+Pg0KPj4gKFhFTikgW1ZULURdRE1B
UjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowNDowMC40XSBmYXVsdCBhZGRyDQo+
PiBiZGY4MDAwMA0KPj4gKFhFTikgW1ZULURdRE1BUjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmlj
ZSBbMDAwMDowNDowMC41XSBmYXVsdCBhZGRyDQo+PiBiZGY4MDAwMA0KPj4gKFhFTikgW1ZULURd
RE1BUjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAwMDowNDowMC42XSBmYXVsdCBhZGRy
DQo+PiBiZGY4MDAwMA0KPj4gKFhFTikgW1ZULURdRE1BUjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRl
dmljZSBbMDAwMDowNDowMC43XSBmYXVsdCBhZGRyDQo+PiBiZGY4MDAwMA0KPj4NCj4+IFRoZXJl
IGFyZSBzZXZlcmFsIFJNUlJzIGNvdmVyaW5nIHRoZSB0aGVzZSBkZXZpY2VzLCB3aXRoOg0KPj4N
Cj4+IChYRU4pIFtWVC1EXWZvdW5kIEFDUElfRE1BUl9STVJSOg0KPj4gKFhFTikgW1ZULURdIGVu
ZHBvaW50OiAwMDAwOjAzOjAwLjANCj4+IChYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAwMDowMTow
MC4wDQo+PiAoWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDE6MDAuMg0KPj4gKFhFTikgW1ZU
LURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjANCj4+IChYRU4pIFtWVC1EXSBlbmRwb2ludDogMDAw
MDowNDowMC4xDQo+PiAoWEVOKSBbVlQtRF0gZW5kcG9pbnQ6IDAwMDA6MDQ6MDAuMg0KPj4gKFhF
TikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjA0OjAwLjMNCj4+IChYRU4pIFtWVC1EXWRtYXIuYzo2
MDg6wqDCoCBSTVJSIHJlZ2lvbjogYmFzZV9hZGRyIGJkZjhmMDAwIGVuZF9hZGRyIGJkZjkyZmZm
DQo+Pg0KPj4gYmVpbmcgdGhlIG9uZSByZWxldmFudCB0byB0aGVzZSBmYXVsdHMuwqAgSSd2ZSBu
b3QgbWFudWFsbHkgZGVjb2RlZCB0aGUNCj4+IERNQVIgdGFibGUgYmVjYXVzZSBkZXZpY2UgcGF0
aHMgYXJlIGhvcnJpYmxlIHRvIGZvbGxvdyBidXQgdGhlcmUgYXJlIGF0DQo+PiBsZWFzdCB0aGUg
Y29ycmVjdCBudW1iZXIgb2YgZW5kcG9pbnRzLsKgIFRoZSBmdW5jdGlvbnMgYWxsIGhhdmUgU1It
SU9WDQo+PiAoZGlzYWJsZWQpIGFuZCBBUkkgKGVuYWJsZWQpLsKgIE5vbmUgaGF2ZSBhbnkgUGhh
bnRvbSBmdW5jdGlvbnMgZGVzY3JpYmVkLg0KPj4NCj4+IFNwZWNpZnlpbmcgcGNpLXBoYW50b209
MDQ6MDAsMSBkb2VzIGFwcGVhciB0byB3b3JrIGFyb3VuZCB0aGUgZmF1bHRzLA0KPj4gYnV0IGl0
J3Mgbm90IHJpZ2h0LCBiZWNhdXNlIGZ1bmN0aW9ucyAxIHRocnUgMyBhcmVuJ3QgYWN0dWFsbHkg
cGhhbnRvbS4NCj4gSW5kZWVkLCBhbmQgSSB0aGluayB5b3UgcmVhbGx5IG1lYW4gInBjaS1waGFu
dG9tPTA0OjAwLDQiLg0KDQpBcyBhIHF1aWNrIHRhbmdlbnQsIHRoZSBjbWRsaW5lIGRvY3MgZm9y
IHBjaS1waGFudG9tPSBhcmUgaW4gZGVzcGVyYXRlDQpuZWVkIG9mIGFuIGV4YW1wbGUgYW5kIGEg
ZGVzY3JpcHRpb24gb2YgaG93IHN0cmlkZSB3b3Jrcy7CoCBJJ3ZlIGdvdCBzb21lDQppZGVhcyBh
bmQgbm90ZXMgam90dGVkIGRvd24uDQoNCkRvIHdlIHJlYWxseSBtZWFuICw0IGhlcmU/wqAgV2hh
dCBoYXBwZW5zIGZvciBmdW5jdGlvbiAxPw0KDQo+IEkgZ3Vlc3Mgd2UNCj4gc2hvdWxkIGFjdHVh
bGx5IHJlZnVzZSAicGNpLXBoYW50b209MDQ6MDAsMSIgaW4gYSBjYXNlIGxpa2UgdGhpcyBvbmUu
DQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgYXQgdGhlIHBvaW50IHdlIHNldCBwZGV2LT5waGFudG9t
X3N0cmlkZSB3ZSBtYXkNCj4gbm90IGtub3cgb2YgdGhlIG90aGVyIGRldmljZXMsIHlldC4gQnV0
IEkgZ3Vlc3Mgd2UgY291bGQgYXR0ZW1wdCBhDQo+IGNvbmZpZyBzcGFjZSByZWFkIG9mIHRoZSBz
dXBwb3NlZCBwaGFudG9tIGZ1bmN0aW9uJ3MgZGV2aWNlL3ZlbmRvcg0KPiBhbmQgZG8gPHdoYXRl
dmVyPiBpZiB0aGVzZSBhcmVuJ3QgYm90aCAweGZmZmYuDQoNCkF0IGEgbWluaW11bSwgd2Ugb3Vn
aHQgdG8gd2FybiB3aGVuIGl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIGlzIHdvbmt5LA0KYnV0IEkg
d291bGRuJ3QgZ28gYXMgZmFyIGFzIHJlamVjdGluZy4NCg0KQWxsIG9mIHRoZXNlIG9wdGlvbnMg
dG8gd29yayBhcm91bmQgZmlybXdhcmUvc3lzdGVtIHNjcmV3dXBzIGFyZSBhcHBsaWVkDQp0byBh
biBhbHJlYWR5LW5vbi13b3JraW5nIHN5c3RlbSwgYW5kIHRoZXJlIGlzIGFic29sdXRlbHkgbm8g
Z3VhcmFudGVlDQp0aGF0IG5lY2Vzc2FyeSBmaXhlcyBtYWtlIGFueSBraW5kIG9mIGxvZ2ljYWwg
c2Vuc2UuDQoNCn5BbmRyZXcNCg==

