Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002F44E63E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 13:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225194.388902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVWU-0005s3-Cy; Fri, 12 Nov 2021 12:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225194.388902; Fri, 12 Nov 2021 12:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlVWU-0005qG-98; Fri, 12 Nov 2021 12:19:14 +0000
Received: by outflank-mailman (input) for mailman id 225194;
 Fri, 12 Nov 2021 12:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlVWT-0005qA-7B
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 12:19:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcc91b78-43b2-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 13:19:10 +0100 (CET)
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
X-Inumbo-ID: bcc91b78-43b2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636719550;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PAbjMjMW4IHkin9JCSoKGyU+8pzQT2EpzzVqJ1o5kAA=;
  b=AdPNIfxqIrkcKH5FK3VXJkBvrvh+1Yqoonu/LQUcocHU98vypN9Sjb5f
   W58ge9fUy/M5pf72WYFPU0Hvu9LMxzx965+wcuX9rn+InrVnMOqV7ikCd
   GvlH/n6syPzPOn+S9cxa/3DXzA3t1RHE8jvV9mGR+glAXaZiJoYFW2hap
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8/2oTWwFotOhAaEPX64ICf/VTYpVqPDuwK5Lwq7kpSlDjIPBs0whs0tSSJT3O8+VVx2UjUAmFb
 Cx8I1eqjKceDX7WZ5dqY85q+If/0hy5NAMtHZLxXN1xz2VkASOYKIcDCFk/+OqFb9cSUokjArH
 +zbmGSDudzyZ4PJYQNU4JjmBc8K09/CMtLRb9I4qt6q4KVDXoy5wi1qvbC1v+/yAAT8t/8LhAw
 yDsV8JUoJQuVA/mUid5xxuNwHEax51Htr9jWnyTf7FAphTEcVk1BU+RQdnNsekYEAULzdz97c8
 KBgbSUhf07CpW2ySmLsUhYKs
X-SBRS: 5.1
X-MesageID: 57640259
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FEyCHKPpiM2YIurvrR1EkMFynXyQoLVcMsEvi/4bfWQNrUoi1mcEz
 2RJXz+GOauDYGb3ctxxOYq18hwDsZOBn4NnQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Es5w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxqGvfth2
 IRQjsPuFwcbFIaLwOAnbiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iVu4MAhmph7ixINdP6Y
 fcrczBsV0nnbhlTKE8IFJMBguj90xETdBUH8QnI9MLb+VP7zwFv0b6rLNvcfPSLQ9lYmgCTo
 Weu13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/VfMcYq+FCQ8fWKvQarLENDFjp7VeVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CJZ8yR5xLpeZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxk3b5heImS4P
 RW7VeZtCHl7ZibCgUhfOdLZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvc21ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:HvUYEqFWSDg0SiZmpLqFe5HXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLX2OpFDNNKz0OHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1QcPhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoF8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4kYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqL0wxhlMfheBEY05DWitvGiM5y4uoOnlt7TFEJnIjtY4idixqzuN6d3FGj9
 60epiA2os+F/P+VpgNcdvpd/HHQ1AlcSi8Ql56Hm6XYJ3vG0i94aIfs49Fqd1DRvQzve0Pcd
 L6IQtliVI=
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57640259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCCIgJh03ZBX/KjUUSNOvlzLHsf+2Oy1IntFiDWLHmp5o9pelxH2xTUr7vmDeIoYJkHsJYbcv+7L+d36zH/SFbOriUvMV+kDyJKoS6ie7G3ZEgdOtTbw6dtmxUiAmya3Djczfd+1skvuVNwvG4R6nqchsh5d/11HNilJxEj3U+QQDKANjGzSnJ/TRScdLmHNzCkBjySAeSsOycsi43S4+JgNEOivsIqstmSqguD/UzDvDhrLNH4ueqGJ+mAc8mlrCqeO458pNBaapkL35MfAuhLrAwoCho8cNVCwqoqjf9f6AZQGRwJniBdRB1HhzdsdEEPNN+zQ5Jx6R66Nb+fESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIutV54LE+Q+hlUsEj+2spGVpbShPkoGYHy5HFs0mDg=;
 b=DLCQ9Yy0vcPEI66qPu1dZrUZcJ7QT9314L6PJzh3R7Sb6No8tLupnIZqlxlYBpI6CBogXwx1KOsIPsGPidMJcdiRJd5d5TXXJtMDshjUaJvck3ROLFI9Fj0XYAuY2gMDNx44JyUqmn/tJc+esUIxcU8++hmNlbOn/uRxSWnNFe6b19frYjKb3uJ2MTSjFKvkNV+3qy3I0AY1zA6rKSuUux2/3WsIa/6ig8tHWpZhs80ytdD4CWiPYBK5hwh9EYePzpndPMeuNJi8x9gqvqb4jr3dnE0kBuYpZGF6qzUeIG8O/jyD4YUyKH96Qi+7phGjp4nxpiFqf5TD5zPBMpGCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIutV54LE+Q+hlUsEj+2spGVpbShPkoGYHy5HFs0mDg=;
 b=qwrqjly8LcS/Dmye8dPsjM+gx00ujODZngMkHeiCczSmd7lqNEXGbxCDomEqd4UVsCZby9lI+gZX9zabfu51zmkkZQlEAdDiq8Ffgrq1gRfGgGeLKAJgL3oEsD0LTKpuIIGvOkclJbmyYPN1fj32HloG3SvL7cnepiQu5GGEitg=
Date: Fri, 12 Nov 2021 13:19:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>
Subject: Re: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Message-ID: <YY5btAKqy85VDDT+@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
 <YY5OztQdQMXJSG+u@Air-de-Roger>
 <6c142f50-84f2-b499-d486-61690cdc2629@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c142f50-84f2-b499-d486-61690cdc2629@suse.com>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d104c1-3fe7-4969-fc2e-08d9a5d69df9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3580:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB3580354BDBE482FEB12313698F959@DM6PR03MB3580.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vj1QdyFPt9XxPRmTnpN0w1do/oGLGLumAKIbOykT6yAgr/1P5dPzQqbcSyP81l96I2uYhulc6MyZtnnu3dHiYGntbzpFxfh/id4L7wrwC+9KQsjQouw7YP5/kcnZpcylC+BUSt+K6+YBzx7PjoOV04JW/wTkmfzc12Nz6IYW5+dZVvcoKel1nETf5E9nYBJg44j6OwTPc7aL2vS4ToyacRx1PK0Hn/fxuzpBHzsTtaA6En2t9AnCQI2fV27n28mQcN1TatY+6yEUwGLeqxZt8NxFr4Br5gBcWv2g2y4iPGQsxDR8LvsVqNWMAZ8+DFT1Z2rzASFo1VSvtjNUI+74fEv5MGHwrRt90P35+bxeZ7Til9Hbg7CXZNlVXFalLc+Y++z6E2QSX9BY4fpxFWu9y0H+ujpRBX4N2jj+mvhDh7FmIA/bR5eEJ4rD8fOxVb15fPCkaX8Pw0WC+6FHQ/+Ac8/w2y5VQ25IvekD2UDWtCeORWkX2YnsFhTiEBDP+TyGCVG1sI6zME1mZdThaAgCf0nwnnZSZhUyWZYALxkuC2A4TLtyfS739RsewxT6uWcr41M9Af+VtmPf9nSqFwYnjm12CyJOzYIofiMmSIvF2vZzbNLqxBbc9fPn6PBBaqRlLaNV449u/zMmE4DtOoJ+iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(9686003)(8936002)(2906002)(38100700002)(66946007)(6916009)(6496006)(6486002)(316002)(54906003)(53546011)(82960400001)(85182001)(26005)(956004)(186003)(4326008)(5660300002)(66556008)(33716001)(66476007)(8676002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnN3STdpdno2aW9UdFVld0JieERXNnZNMkJHYUFnWnVFcWRQTEkvZ3pWelJm?=
 =?utf-8?B?U2tIbGd6ZHVKQmR4cVpPcC9YK1YrNkY5MkNHSnZaaHVpcURFK0Fsd2ZnY0Ir?=
 =?utf-8?B?dnUrVVRUVE5KUFFtL1RTb0Z6c3RoZHo1OFYyRUxWNG9Hb2RTaHBSUy81ZG1n?=
 =?utf-8?B?KzBXd2VxZURjSllna01QQkhxUW80TnNZRFdoUk9tNzlPT052bmtRQnpWTUxw?=
 =?utf-8?B?WlJ4LzRRd1hvejB1V21ZT20wdCtheW9KcytNckg2bm1rOXl1ajBNakhpRVFI?=
 =?utf-8?B?djl5L1FDYWNDb0Z5RkRQS28yYjhCaFFHcXNPTGNtdzg5TXRWL0VHSHU1RHhr?=
 =?utf-8?B?Qm1OSzVObGJqbEVIZTR6ekdDd0lxR0VDWmJlMVdnL0s0VVd1VENQazF1SHd4?=
 =?utf-8?B?NThhMEEwdDE4TUF6TGZJVHgwblpzR0VETjdkYk0zOUFCckY3cmQ0Mnk5YUtO?=
 =?utf-8?B?RHRKbzNIL1d4ZTB2NjZJdk5tQWhRK3orZ1Vpdm1vYkZPZ2ZKNGdGNVNNdDA1?=
 =?utf-8?B?R3VqTi9oYlZsOERKNnRyTFdvNFNQY293RXExdlplWUVlRE4xdXpPTjg5S0hO?=
 =?utf-8?B?d2I5MGUwaFZvSG9SV3YybDZlSzF3a3dMbHNnSWtnMUNFbkl3TkRrZkVtMEtK?=
 =?utf-8?B?eVFpN3hDZXRmT1gvaWZ4d0Ewc0FpNVB0SzkzNWVSVzBaNjBtY3l0TmhwVmhT?=
 =?utf-8?B?VTRzZUdXbU1xWXVObHNaQjhDRkNUd1JSV282dStGVkxEdzNOU2NwaXpQNlN3?=
 =?utf-8?B?cnlBZ05uTlplNDJ4WGh3WG5FV01VWjlURURmMmViUGsxV0JjTkNhN1lOUzlD?=
 =?utf-8?B?R3lyMVBqSWxpMTJxNzJlNVc0OUJrUXBBOU95WTRyQjBFM0RiS3p4YkpRbnl1?=
 =?utf-8?B?WFRjODBBQ1pqV0M0c2JjZmpJUnpFY0gvVXVXRXVsSFFHUzloWmZrME9kNHcz?=
 =?utf-8?B?U0ZiMm9maXNoNzBQTS8zM1hJNjZKQXdBM2kzSFFSUXpVaHRGdTZBS1E4RGZ0?=
 =?utf-8?B?bGtqdCtsak9EM1BVRWpHL2IwNlB1R2s4aG1yOXZiaTI5M3JzVEdhalFBaHVl?=
 =?utf-8?B?cVA5OElyK0JaeUdmdzdXSzd1TXZuOTRJQTNmNkQ0d1VZek5Hc0NxMEk0akNV?=
 =?utf-8?B?elNoa0VIVTlKNzF3dWltcTVRRkRSRno3R1BLME55cHBNOXovTG5WV3hZSVJL?=
 =?utf-8?B?cnJqYURnNU1yOXo4em9aNS9FUGV3NzFjZ2VnOURlMkhDU1RpdnlWV3pjYnhE?=
 =?utf-8?B?NStyeGdMREdEeEdkVXpHcC9FU2VnRDI0NTB4RHIwOUhVYS85NkU2MmNKWmFm?=
 =?utf-8?B?LzlxQTBZbURjK0RSL1hsdDFrakQ5TnF6TUlUYk9CSjFRN3p2SXRMSnkwOTht?=
 =?utf-8?B?bkp5WUJkUkQxUlNSaVNvWGd6bEs5TWFWSkd6U0lsZVg4NXpGdUt3b01nQ0cw?=
 =?utf-8?B?bjhkckIrWER0NGIrSStxWlhoVFVaaHVNdzFmZEhKQ1IrMU9qMWV2M295VXVG?=
 =?utf-8?B?WkxnME0rRTlLa1RWMVZyS1RqR3lRNG5Nd29hRVBEQkRFSm1YS2l0VlRENC9v?=
 =?utf-8?B?NFd5TFBJTmVjbXJHUXVRbE9wMGJtL0I5U2NxdWFzbmJUZzZtSjRBRFRYUGY3?=
 =?utf-8?B?M3dhcGVWTHl2RDdjOHBkQ3hKTEZYS2RBUzJCRktwUmxVa2JaMWlTOGwxZThq?=
 =?utf-8?B?M3h1MFptQlE5cVQ0SlBhTzFwNVYwKzBocUtnUDRiSlJVa1YvRjMzSmVTR0FF?=
 =?utf-8?B?OGZpU3AxS2NLVkoveUVMbUw5aGFucVVjSUo2UW5YY3RzdkJJaHhKTU9wVkNJ?=
 =?utf-8?B?d2MzU1g2NDNZcnlIZXRQSXZvVmtISkpKVFIwNEpmL1hrRnZZWUs2NkdTY0pD?=
 =?utf-8?B?TzRYdldHcTZNNmFzeGVkYk9XZFBVNnB5NWxMamJJV3hMYzV4M0RlU3hoL3JN?=
 =?utf-8?B?VjFaZ3JmWklXTmNjMXg5Wnowdm15WnZSSTF2MFdkSHVlWjlJZ21qbHN6Vllv?=
 =?utf-8?B?SVUvamR6L01LQ21pVUFjb3I4eUtnSGtGNGpuUzNsUmdMWjEzc3FsaG9xOUFl?=
 =?utf-8?B?UE9nUmZKSnNlckU2NmdKS2VoYWtGMlE5Y2ZUYWg0QTdSM1VmekhwOXZkUE9F?=
 =?utf-8?B?MnkzR2N2UlVBejJ5SS9mcHVoK1kvcGNkbXdtNlY1eEtuZk1na1VQbFloN0pr?=
 =?utf-8?Q?IEuNcc60yZ2y8QcQVl1tCls=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d104c1-3fe7-4969-fc2e-08d9a5d69df9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 12:19:04.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XAbwChC8jYoVZIyZKMwOhOlKgksm1RekdSR4MFpeAc0/YZnyCxZoeNjTTStq+P7enFe048VkDq8QGVYYErl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3580
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 01:07:33PM +0100, Jan Beulich wrote:
> On 12.11.2021 12:23, Roger Pau Monné wrote:
> > On Fri, Nov 12, 2021 at 10:47:59AM +0100, Jan Beulich wrote:
> >> Merely setting bit 0 in the bitmap is insufficient, as then Dom0 will
> >> still have DID 0 allocated to it, because of the zero-filling of
> >> domid_map[]. Set slot 0 to DOMID_INVALID to keep DID 0 from getting
> >> used.
> > 
> > Shouldn't the whole domid_map be initialized to DOMID_INVALID to
> > prevent dom0 matching against any unused slot?
> > 
> > Similarly cleanup_domid_map should set the slot to DOMID_INVALID.
> 
> I don't think so, that's the purpose of setting the bit in domid_bitmap.
> The problem really was only with setting a bit in that bitmap without
> invalidating the corresponding slot.
> 
> This said, I can still see value in doing as you suggest, but as a
> separate change with a different justification. In fact domid_bitmap is
> kind of redundant now anyway; aiui it was the thing that existed first.
> Then domid_map[] was simply added, rather than fully replacing the
> original bitmap.

I guess using domid_bitmap to find a free slot is faster than scanning
the array of iommu IDs to domids. Not sure how performance critical
that search is, so maybe it's fine to just drop domid_bitmap and rely
exclusively on the array.

Thanks, Roger.

