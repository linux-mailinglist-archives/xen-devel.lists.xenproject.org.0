Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C95143AB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317009.536138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLhm-0002Se-BX; Fri, 29 Apr 2022 08:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317009.536138; Fri, 29 Apr 2022 08:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLhm-0002Q4-8G; Fri, 29 Apr 2022 08:10:22 +0000
Received: by outflank-mailman (input) for mailman id 317009;
 Fri, 29 Apr 2022 08:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkLhl-0002Py-3N
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 08:10:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdef817a-c793-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 10:10:19 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 04:10:16 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4178.namprd03.prod.outlook.com (2603:10b6:208:67::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 08:10:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 08:10:12 +0000
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
X-Inumbo-ID: cdef817a-c793-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651219819;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=I4k0WBWYj+5b9sQGJpTwboduel8P7U3Y7PIZAQosLJg=;
  b=Gm2UxnvLsdxD5HMONB7LyijRbfU2PRycSoWypz2wysz9ziY3QEnkHYRx
   TxWSeQBIZdmw+ONjFaNFEukQvZlioCeOnOx2xPRy8R1UgANFpL3G5fRT1
   H7VvTfvLcyYdK1almNb3XANRp95ri23uIBQ42vuL3shywH/1Jw2BvsCXG
   Y=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 69608566
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U7g7+avBo7k2hr9GG2x6VRpaAOfnVCJfMUV32f8akzHdYApBsoF/q
 tZmKT+OM/aDZGf3fd13aN+2pE8B7ZTSy4QyTApuqXwwRHgQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW1/X6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9yOpPFqbsxbiNKTRNVBIoX95rpInSg5Jn7I03uKxMAwt1IJWRvZcg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5o2aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgAzE+/JnvjaNpOB3+KHUHsTLZc2HfNRcumfIn
 zqd7UO+Ow5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUHBBqlz6PV50OVAzYCRzsYMNg+7pZuGnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:vFSlYqBBxXzwwRjlHeg/sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dNMEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfXHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+06VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qY5+FNuAxem0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,297,1647316800"; 
   d="scan'208";a="69608566"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irGbea6lB8ijBfIcamUvlgeBRnSR0pSSL/qDdP98Fi2RYVyUI7Rh8vU3guFcGCt37CtS67zrNi9JQpyf9jd4CJf6HIjM/VAdAlYHPLZzZ68r/Y+giRg/1bocK7TkwCXMH3i/mvDPEM/OUgG5Bpv0WuBvVM/RjKg88EpkTqgFLCDT9FANQvMpsFq56IvJQE1xSRuznYFPoAfBYuss3eiQrWOps/KYUunEWmDV9qfnKiOdVwpYSSgK+LELow8ioSZUsZNT1Lc62KGqQMDPr4CFvPxNkl76CsoEsYo48A7CcVXRlqxpY48YxKUuw+DSCrYwsdmPtRyvsjJkoZbsEyH1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfXZbNMjIvgW4jqo0FcHbguhQKNiLhEPP2OQCR7DD7I=;
 b=k/KVpRB6elItLBTE7QrQ75nHAmhneQxR5C2f0OYMknNhg067KXwvi52DlYWa4JzHIVbUAImiXp8pgXbij4hyTbxoFUu6GiQu6JTamABIvE0MO19A1SRbBi4GsI6ZxrRxihRWH9mG43mVXm/RnIENIIO2eg+xhtzfHK9w4I9batHgKNkkwOsbsoc2HE8DvMXb06xH/jEYMRztXner16gjlLyYj11jv3LqzyKOxC6DRCOdhq3wSd4oFNbDGEKV7ob7GcM02EnNCPtZEp07+W4CqOEI9HMQwQxwqCT0aL+Jrny06ErPuz1Knjk/ThkTWg61k9S8UVqUMecM3+KwN7ExFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfXZbNMjIvgW4jqo0FcHbguhQKNiLhEPP2OQCR7DD7I=;
 b=BIWijIhVB9pEo6LsFKCxe6kFC7srekjKyzzshZANLOFTYvYUKnU9nib/GRUsgEoB3xTWhEakL0pKfqOo4VLa6EsU46D21MF3a6SWk9OoZj7dRcgMY3VnN/XvQHG0HMMNGmoCLNRdSVXsNBa5cKwjxCJIfUNIPiKWZdL1czyBVfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 10:10:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Message-ID: <YmudX/vwbBTxNhMw@Air-de-Roger>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
X-ClientProxiedBy: MR2P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97186cc9-eb7b-4ab3-ad2f-08da29b7af1f
X-MS-TrafficTypeDiagnostic: BL0PR03MB4178:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB417878C3252A3F5972360DF68FFC9@BL0PR03MB4178.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I0CpyWEKLwLjaqcLnUvK2h/qQyQWC+eKSuuhxyirrtVITdDwvbtANOJstaNmikcet3+L0VE011YomM2R43KyNF8bOwZL6zk8YpAOVvAI0hX83QsUgMrip7zi95RNY+1BJBb4hZ9EVN+GlRn7h7B6e6FUq9VFWEQ98xiA7Z/ZH4qnaBxF8yh2HWaquJf4Zxokx1j61KQ/aIsd9AfF06eBZMgGFtAzkpb2MURU6cS8/y+7V5DUmPFGE0LVvGhhdsG7HxEkNiP2FuOX9u9CS/6PFBqNzlMvi1QgGaQV8PqREfXMyjpOyqTjQ5aye0u6cHCa0+2Ia1rCaMNeaIEGb3FN45qFQbMvtlkGcsshGdwS4O3CHhVn9SxZrYN7ZBew2iV689zrd5nEU1+Wjl5rsD+z7rxN8OYP3u0rDiKBsLMeIqxfB6i5qO6V5+rzbRqLOugVoIDPf1GL2Ih90jf0AfLKxUYpVqZ9eIFbbbNu0iL6xyJjVIob+Pmpj5M0blmADcdyfv1oVdKJ8ukxZYcceIZAr4M/3to7tJOQ3DCSMIW+6yy6a9ao6yKUFoljuJMyCIy7fDQbw6T4Sg/ABGGweFCLt9jCRldMxMqaoRQM24l2riDMW9jNuVVASNPyfaWwUmJlH+1zSUWmtgmn2txut3sVpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(508600001)(86362001)(53546011)(26005)(6512007)(6506007)(9686003)(38100700002)(82960400001)(6666004)(66476007)(316002)(2906002)(33716001)(66946007)(66556008)(186003)(5660300002)(85182001)(8936002)(54906003)(4326008)(6916009)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1AxbnBTZEpqbC85TWhvZHJvUlJlOVVpdXdiSlpqUnBxTVFRTXlFbWttUVhQ?=
 =?utf-8?B?bzdzWTRaRjVxSEJhTVpxWUNubHV3STE5RFplbktsYnRGSFlyY3hnR2xYTnBk?=
 =?utf-8?B?dWQzeFFTTVl5ODRxUi9NbEtRTnFtUmYwQ0x5ejlhK0ZFYno0NVVFd0U2Ui9I?=
 =?utf-8?B?eDdsRExWSWc4QlpoMmpQdnFBcW04aWhPU1d5cWNZK2poYUdrZmZQbjFnNmpR?=
 =?utf-8?B?ZFo3K3h1ZVJPZllleUQ3S3k3UmJtcWltaDVaTzZZcUh4Nnc1RnoxclNkeFFu?=
 =?utf-8?B?M3VvY0J2RGpneW9lR0ovTCtJdUlPRE42Um1iNU9ZWjdEN3ZuS1JJcEY0RnU4?=
 =?utf-8?B?NlB2LzljcDUzZXNHVW9MN0F5b0Nad2ZxTlZDTWEzaCtLN0doZmxIaWNsWFBQ?=
 =?utf-8?B?M1NEbnhkcEh3UE5MZ091dmZPVmMyWndCYy9SaUUybUtjTlJjK0NNTVNZb0t4?=
 =?utf-8?B?bEk1ZUJEQlArSjdzWEV6cEd1d1pYLzROc25HRytaZHlRRzhPSkVNWG9sLzhY?=
 =?utf-8?B?VXhaTFhHWEdibjVYZWxQU1FHZWRBVkd3K3VHbXlsSUxPZnFkOXBOVWxnZFh3?=
 =?utf-8?B?UmwzNFFPUHo2ZnZuckFXTmo0Znh4WURmcXp2YVR2cGRUUEpFK2gzekdaODlj?=
 =?utf-8?B?OW0rSTRVcnhrNGdmQWV2RXBvNGwveUhPY1hvU3BLZVlzaC9DUnZ2eFhqY3I5?=
 =?utf-8?B?Z1IxT2oyalBINmJnSVFxMk9KYzk4eXh4Zms1cTB6NktpWHNmM2xXNkplWExT?=
 =?utf-8?B?aXdhTGV0OHhHNExVaEgvWTFWTXVJdXg4ZHZpZzg0ekwrOFBncU1PWWI1UDNS?=
 =?utf-8?B?eTRLOGVCajRLZzRmY044b0JEbmFYd1dSRzUwb2xFcGlGUjZRbDg3SjVESVAy?=
 =?utf-8?B?TzQycnJoY0JJd0xIQjZVaXNDRTRXRnA5dHVvUjJ3SEtMb3ZkUzFDdGl1aU82?=
 =?utf-8?B?dDc4QjBtd29rK0IrUWdpWU5lOUdncTNVWFQrUUovZHREQlFhS2hiTno5b2Ri?=
 =?utf-8?B?Z2l1MDlwbUZFL21YNkZGQ0J4KzZEaTZsRkk3cU5hVnlCTDNuKzVxTU53MUpL?=
 =?utf-8?B?dUtjVkdTOHEydDgxbWJxTyt3NmJOWFRWbytvS2V0cWV2MktRdzNjMDV1MC9R?=
 =?utf-8?B?K1c5WHlyMmR5UDBVeFRzQnBVVERVeEdhSjVhcGIyY1p5VllpQ2IzamlyUHlq?=
 =?utf-8?B?UDREVHhEVndnRFhaMTBMOEpsaG1IM24yT09PeURvSEVWWER4S1BPTkp2T091?=
 =?utf-8?B?djJYVE9maCtTVytBUXo5MDFnSzVjWElTcXpITmRWdkJiYXJ6ZzJvUjJXOFk3?=
 =?utf-8?B?M3dYdDVMRkNtZU16UkljUHUxbnFHT2dkUVlveFJXOVExY3grbGxrUXpwdWk5?=
 =?utf-8?B?bFJMQVY1MldqL3YrYk8rRkFTNHZRc1hhaVlzZU01YVJJRU5qaDM0cmxRT0Yz?=
 =?utf-8?B?bE9QeGJXanJyQnZMa0VIQjFDd3c5YmFIVDhSQkV2SW5zL3NBVUl5Tno3V1BH?=
 =?utf-8?B?c2p6V1BKTUI1ZTdaSjdzLzc5R0MvU2x1NzFveHpuS2pzOVlPblNtZ0dRQThF?=
 =?utf-8?B?SFZBTjI2RDVOeE5WMVBIcjk1N3U3bzlMd2lnK3R5dGdZUVJiTmNaSmdsN016?=
 =?utf-8?B?SERCRFJXQUEyVWlEbEV5Wm1EU1hLWWhwdndlWTFoS3VFbktFR3p5NnJ5QUto?=
 =?utf-8?B?NkR1bDJuVVZJbUIrbTFXREtvVXkyL0ZPUVNxQ2dscjQ3QjFjOGpiTjY4T1Jr?=
 =?utf-8?B?MmtMdjZHcGl1N2RqT1VaaUlpNXpFNEhFSG12eEpUaTJ4MmhlWDc5ZmQ2N3dI?=
 =?utf-8?B?K0laTzJkaDM5Q3Z0Q1pFTmNxM0ZGZENFVGxhdVVEbEx4OWZPYWVZUEJXUVV3?=
 =?utf-8?B?c3V5SlVCTkU1bjVKamR1LzlNZ0dLOWlmQUdlWkJnZTg5UWNvQVZwV2hGcTVZ?=
 =?utf-8?B?NmRGVmxhUEUvRUJvdGpOOEkydW5KcHVFVHVxTmdHSnVOTDU2SmgvWXdvdUlE?=
 =?utf-8?B?b3pxSXZ1SFJlU2svNnFpeUJSdCs5dXlkZnhxWUVwK0s2V1M1R1VqS3hxdEZU?=
 =?utf-8?B?NFRyeFNCcEFBN1pFczRyelZ5U2tya1ZTVGtJVWlBZ3RkeTZNa2dDaDRtWUJa?=
 =?utf-8?B?QWVhbitmTjdLUFpOMFY2aFF1d0E3MXJCM1Z1OUwrTGtnVzZHRjlKR3BrVWpN?=
 =?utf-8?B?VFlOczBCencxYTNhK081aWNsMHU4eGdINzJnbGpmMjJjL0tYWDVNZ1NOcHBn?=
 =?utf-8?B?L3JuK2lIVUxWL3hjN0FXQW9yOERScmdnMUtnbHFUcXVPU01zYjlKejViVnZp?=
 =?utf-8?B?bnBmNTVrdnpyeUU1ZGdqR0lkUUh2MCt2T3MzNzJXem9kMktueGFsYjd3WVY0?=
 =?utf-8?Q?riQTwYWy3uotp6Ug=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97186cc9-eb7b-4ab3-ad2f-08da29b7af1f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 08:10:12.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJMdInr66qdFFLAMqTbBHqgTriNIVsW+DqPMxSkgCHuGUEq3Btn9HJbz/L9YGa92WxFiLYoLifJ8Y0HW2J66bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4178

On Thu, Apr 28, 2022 at 12:13:31PM +0200, Jan Beulich wrote:
> On 28.04.2022 10:52, Andrew Cooper wrote:
> > @@ -283,6 +283,8 @@ CET is incompatible with 32bit PV guests.  If any CET sub-options are active,
> >  they will override the `pv=32` boolean to `false`.  Backwards compatibility
> >  can be maintained with the pv-shim mechanism.
> >  
> > +*   An unqualified boolean is shorthand for setting all suboptions at once.
> 
> You're the native speaker, but I wonder whether there an "a" missing
> before "shorthand".
> 
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -117,7 +117,20 @@ static int __init cf_check parse_cet(const char *s)
> >          if ( !ss )
> >              ss = strchr(s, '\0');
> >  
> > -        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
> > +        if ( (val = parse_bool(s, ss)) >= 0 )
> > +        {
> > +#ifdef CONFIG_XEN_SHSTK
> > +            opt_xen_shstk = val;
> > +#else
> > +            no_config_param("XEN_SHSTK", "cet", s, ss);
> > +#endif
> > +#ifdef CONFIG_XEN_IBT
> > +            opt_xen_ibt = val;
> > +#else
> > +            no_config_param("XEN_IBT", "cet", s, ss);
> > +#endif
> 
> There shouldn't be two invocations of no_config_param() here; imo if
> either CONFIG_* is defined, use of the option shouldn't produce any
> warning at all.

Hm, I think we would want to warn if someone sets cet=1 but some of
the options have not been built in?  Or else a not very conscious
administrator might believe that all CET options are enabled when some
might not be present in the build.  This would also assume that all
options are positive.

IMO the current approach doesn't seem bad to me, I think it's always
better to error on the side of printing too verbose information rather
than omitting it, specially when it's related to user input on the
command line and security sensitive options.

Thanks, Roger.

